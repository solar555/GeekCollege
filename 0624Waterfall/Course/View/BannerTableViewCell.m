//
//  CostumTableViewCell.m
//  GetGeekDatasource
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 solar. All rights reserved.
//
#define WIDTH self.contentView.size.width
#define HEIGHT self.contentView.size.height
#define SCROLLVIEW_HEIGHT 180

#import "BannerTableViewCell.h"
#import "UIView+SDAutoLayout.h"
#import "GeekTool.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Hex.h"

@interface BannerTableViewCell ()<UIScrollViewAccessibilityDelegate,GeekDatasourceDelegate>
{
    int _speed;
    NSTimer *_timer;
    GeekTool *_geekTool;
}
@end
@implementation BannerTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.获取数据
        _geekTool = [[GeekTool alloc]init];
        _geekTool.delegate = self;
        NSString *bannerUrlStr = @"http://api.jikexueyuan.com/v3/activity/banner?api_key=sEc5qE9f&api_sig=9355c1b2d09dc9164cd6262faa6024f6&channel=AppStore&from=2-10.0-4.2.1&nonce=-247574&timestamp=1467247686&type=2";
        [_geekTool getDatasourceWithUrlString:bannerUrlStr];
        //2.创建scrollview
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, SCROLLVIEW_HEIGHT)];
        _scrollView.pagingEnabled =YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = FALSE;
        //设置代理
        _scrollView.delegate = self;
        [self.contentView addSubview:_scrollView];
        //3.创建PageControl
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.center = CGPointMake(WIDTH / 2, SCROLLVIEW_HEIGHT - 10);
        _pageControl.bounds = CGRectMake(0, 0, 120, 10);
        [self.contentView addSubview:_pageControl];
        //4.自动布局
        [self setupAutoHeightWithBottomView:self.pageControl bottomMargin:5];
    }
    return self;
}

- (void)createScrollView{
    //图片数组
    self.imageViewArray = [[NSMutableArray alloc]init];
    NSArray *bannerLists = self.bannerMadal.data.lists;
    
    for (int i = 0; i < bannerLists.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        BMLists *lists = bannerLists[i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:lists.image]];
        [self.imageViewArray addObject:imageView];
    }
    //设置scrollview
    NSUInteger imageViewCount = self.imageViewArray.count;
    _scrollView.contentSize = CGSizeMake(WIDTH * imageViewCount, SCROLLVIEW_HEIGHT);
    for (int i = 0; i < imageViewCount; i++)
    {
        self.imageViewArray[i].frame = CGRectMake(i * WIDTH, 0, WIDTH, SCROLLVIEW_HEIGHT);
        [_scrollView addSubview:self.imageViewArray[i]];
    }
    //设置pageController
    _pageControl.numberOfPages = 3;
    _pageControl.pageIndicatorTintColor = [UIColor colorWithHexString:@"#d2d2d2"];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithHexString:@"#35b558"];
    [_pageControl addTarget:self action:@selector(changeImg:) forControlEvents:UIControlEventValueChanged];
    _speed = 1;
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    }
}
#pragma mark 改变图片页数
- (void)changeImg:(UIPageControl *)pageControl
{
    [_scrollView setContentOffset:CGPointMake(pageControl.currentPage *WIDTH, 0) animated:YES];
}
#pragma mark 定时器
- (void)onTimer
{
    if (_pageControl.currentPage == 0)
    {
        _speed = 1;
    }
    else if (_pageControl.currentPage == 2)
    {
        _speed = -1;
    }
    
    _pageControl.currentPage = _pageControl.currentPage + _speed;
    
    [_scrollView setContentOffset:CGPointMake(_pageControl.currentPage * WIDTH, 0) animated:YES];
}
#pragma mark 关闭定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (_timer)
    {
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark 开启定时器
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / WIDTH;
    if (_pageControl.currentPage == 0)
    {
        _speed = 1;
    }
    else if (_pageControl.currentPage == 2)
    {
        _speed = -1;
    }
    if (_timer == nil)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    }
}
#pragma mark -
#pragma mark GeekDatasourceDelegate
- (void)geekTool:(GeekTool*)geekTool didGetDatasource:(NSDictionary*)dictionary{
    self.bannerMadal = [BMCourseBannerModal modelObjectWithDictionary:dictionary];
    if (self.bannerMadal) {
        //创建scrollview
        [self createScrollView];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end

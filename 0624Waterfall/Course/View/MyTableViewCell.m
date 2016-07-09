//
//  MyTableViewCell.m
//  0624Waterfall
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 solar. All rights reserved.
//

#define WIDTH self.contentView.size.width
#define HEIGHT self.contentView.size.height
#define SCROLLVIEW_HEIGHT 106

#import "MyTableViewCell.h"
#import "UIView+SDAutoLayout.h"
#import "GeekTool.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Hex.h"

@interface MyTableViewCell ()<UIScrollViewAccessibilityDelegate,GeekDatasourceDelegate>
{
    GeekTool *_geekTool;
}
@end
@implementation MyTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.获取数据
        _geekTool = [[GeekTool alloc]init];
        _geekTool.delegate = self;
        NSString *myUrlStr = @"http://api.jikexueyuan.com/v3/course/my?api_key=sEc5qE9f&api_sig=35f612e4d71a25013c9e8939a2795ffc&channel=AppStore&from=2-10.0-4.2.1&n=8&nonce=5192413&p=1&timestamp=1467247686&uid=4199754";
        
        [_geekTool getDatasourceWithUrlString:myUrlStr];
        //0.创建headView
        _headView = [[UIView alloc]init];
        _headView.backgroundColor = [UIColor colorWithHexString:@"#efeff5"];
        [self.contentView addSubview:_headView];
        //1.创建title
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"我的推荐";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_titleLabel];
        //2.创建scrollview
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.pagingEnabled =NO;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = FALSE;
        //设置代理
        _scrollView.delegate = self;
        [self.contentView addSubview:_scrollView];
        
        //4.自动布局
        _headView.sd_layout
        .widthIs(WIDTH)
        .heightIs(9);
        
        _titleLabel.sd_layout
        .leftSpaceToView(self.contentView,11)
        .topSpaceToView(_headView,10)
        .widthIs(60)
        .heightIs(14);
        
        _scrollView.sd_layout
        .leftSpaceToView(self.contentView,11)
        .topSpaceToView(_titleLabel,11)
        .widthIs(WIDTH)
        .heightIs(SCROLLVIEW_HEIGHT);
        [self setupAutoHeightWithBottomView:self.scrollView bottomMargin:0];
    }
    return self;
}

- (void)createScrollView{
    //bigView数组
    self.myCourseViewArray = [[NSMutableArray alloc]init];
    NSArray *courseLists = self.myMadal.data.course;
    
    for (int i = 0; i < courseLists.count; i++) {
        //大View（包含Lab、img）
        MyCourseView *bigView = [[MyCourseView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, SCROLLVIEW_HEIGHT)];
        MMCourse *course = courseLists[i];
        UIImageView *imageView = [[UIImageView alloc]init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:course.img]];
        bigView.smallImageView.image = imageView.image;
        bigView.titleLabel.text = course.title;
        bigView.timeLabel.text = [NSString stringWithFormat:@"%.0lf分钟",course.time];
        bigView.studyNumLabel.text = [NSString stringWithFormat:@"%.0lf人学习",course.studyNum];
        [self.myCourseViewArray addObject:bigView];
    }
    //设置scrollview
    NSUInteger myCourseViewCount = self.myCourseViewArray.count;
    _scrollView.contentSize = CGSizeMake((120 + 5) * myCourseViewCount, SCROLLVIEW_HEIGHT);
    for (int i = 0; i < myCourseViewCount; i++)
    {
        self.myCourseViewArray[i].frame = CGRectMake(i * (120 + 5), 0, 120, SCROLLVIEW_HEIGHT);
        [_scrollView addSubview:self.myCourseViewArray[i]];
    }
}

#pragma mark -
#pragma mark GeekDatasourceDelegate
- (void)geekTool:(GeekTool*)geekTool didGetDatasource:(NSDictionary*)dictionary{
    self.myMadal = [MMCourseMyModal modelObjectWithDictionary:dictionary];
    if (self.myMadal) {
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

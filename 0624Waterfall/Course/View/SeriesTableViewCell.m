//
//  SeriesTableViewCell.m
//  
//
//  Created by mac on 16/6/30.
//
//
#define WIDTH self.contentView.size.width
#define HEIGHT self.contentView.size.height
#define SCROLLVIEW_HEIGHT 106

#import "SeriesTableViewCell.h"
#import "SeriesCollectionViewCell.h"
#import "UIView+SDAutoLayout.h"
#import "GeekTool.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Hex.h"

@interface SeriesTableViewCell ()<UIScrollViewAccessibilityDelegate,GeekDatasourceDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
{
    GeekTool *_geekTool;
}
@end

#import "SeriesTableViewCell.h"

@implementation SeriesTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.获取数据
        _geekTool = [[GeekTool alloc]init];
        _geekTool.delegate = self;
        NSString *myUrlStr = @"http://api.jikexueyuan.com/v3/series/home?api_key=sEc5qE9f&api_sig=4c50c09f1a70d4f052bca14fb3249927&channel=AppStore&from=2-10.0-4.2.1&nonce=-3593334&timestamp=1467271188&uid=4199754";
        [_geekTool getDatasourceWithUrlString:myUrlStr];
        //0.创建headView
        _headView = [[UIView alloc]init];
        _headView.backgroundColor = [UIColor colorWithHexString:@"#efeff5"];
        [self.contentView addSubview:_headView];
        //2.创建标题
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"精品系列课程";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_titleLabel];
        //3.创建collectionview
        [self createCollectionView];
        //4.创建PageControl
        _pageControl = [[UIPageControl alloc]init];
        //4.设置pageControl
        _pageControl.numberOfPages = 6;
        _pageControl.pageIndicatorTintColor = [UIColor colorWithHexString:@"#d2d2d2"];
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithHexString:@"#35b558"];
        [_pageControl addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:_pageControl];
        
        //5.自动布局
        _headView.sd_layout
        .widthIs(WIDTH)
        .heightIs(9);
        
        _titleLabel.sd_layout
        .topSpaceToView(_headView,10)
        .leftSpaceToView(self.contentView,11)
        .widthIs(100)
        .heightIs(14);
        
        _collectionView.sd_layout
        .topSpaceToView(_titleLabel,10)
        .leftSpaceToView(self.contentView,0)
        .heightIs(168)
        .widthIs(WIDTH);
        
        _pageControl.sd_layout
        .centerXEqualToView(self.contentView)
        .topSpaceToView(_collectionView,8)
        .heightIs(7)
        .widthIs(150);
        
        [self setupAutoHeightWithBottomView:self.pageControl bottomMargin:7];
    }
    return self;
}
#pragma mark 创建CollectionView
- (void)createCollectionView{
    //1.创建Layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0;//最小行间距
    flowLayout.minimumInteritemSpacing = 0;//每个单元格的左右间距
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滑动的方向
    flowLayout.itemSize = CGSizeMake(CGRectGetWidth([[UIScreen mainScreen]bounds])/2.f, 168);//单元格大小
    //2.创建 CollectionView
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH+6, 168) collectionViewLayout:flowLayout];
    //collectionView 跟TableView一样
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _collectionView.pagingEnabled = NO;
    //3.注册Cell（跟TableView一样）
    [_collectionView registerClass:[SeriesCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
}
#pragma mark 改变图片页数
- (void)changeImage:(UIPageControl *)pageControl
{
    [_collectionView setContentOffset:CGPointMake(pageControl.currentPage *WIDTH, 0) animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = _collectionView.contentOffset.x / WIDTH;
}
#pragma mark - **************** CollectionView代理方法
#pragma mark 行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.myMadal.data.lists.count;
}

#pragma mark 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SeriesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    NSArray *seriesLists = self.myMadal.data.lists;
    SMLists *series = seriesLists[indexPath.row];
    
    [cell.seriesView.imageAppImageView sd_setImageWithURL:[NSURL URLWithString:series.imageApp]];
    cell.seriesView.studyCountLabel.text = [NSString stringWithFormat:@"%@人学习",series.studyCount];
    cell.seriesView.collectStatus = series.collectStatus;
    NSString *collectTitle = cell.seriesView.collectStatus ? @"取消" : @"收藏";
    [cell.seriesView.collectButton setTitle:collectTitle forState:UIControlStateNormal];
    
    cell.layer.borderColor= [UIColor colorWithHexString:@"#d2d2d2"].CGColor;
    cell.layer.borderWidth=0.3;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}
#pragma mark -
#pragma mark GeekDatasourceDelegate
- (void)geekTool:(GeekTool*)geekTool didGetDatasource:(NSDictionary*)dictionary{
    self.myMadal = [SMCourseSeriesModal modelObjectWithDictionary:dictionary];
    if (self.myMadal) {
        //创建scrollview
        [self.collectionView reloadData];
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

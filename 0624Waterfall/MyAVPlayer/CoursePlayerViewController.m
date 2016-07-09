//
//  CoursePlayerViewController.m
//  0624Waterfall
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 solar. All rights reserved.
//
#define WIDTH [[UIScreen mainScreen]bounds].size.width
#define HEIGHT [[UIScreen mainScreen]bounds].size.height

#import "CoursePlayerViewController.h"
#import "UIView+SDAutoLayout.h"

@interface CoursePlayerViewController ()<UIScrollViewAccessibilityDelegate,GeekDatasourceDelegate,UICollectionViewDelegate,UICollectionViewDataSource>{
    GeekTool *_geekTool;
    NSString *_videoUrlString;
    UIImageView *_buttonBackgroundImageView;
    UIButton *_currentButton;
    UIButton *_oldButton;
}

@end

@implementation CoursePlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    //1.获取数据
    [self getDatasource];
    //2.添加Video
    [self createVideo];
    //3.创建toolbar
    [self createHeaderToolbar];
    //4.添加CollectionView
//    [self createCollectionView];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}
#pragma mark 创建video
- (void)createVideo{
    //http://api.jikexueyuan.com/v3/video/play?api_key=sEc5qE9f&api_sig=8dcbcbf2aa8a0ae32f537822b141852b&channel=AppStore&cid=2582&from=2-10.0-4.2.1&nonce=73890&seq=1&ss=master&timestamp=1467622249&uid=4199754
    //上面的接口内有一个url，此url就是下面的urlString2
    //更换cid即可更换视频的播放
    //1.url
    //替换cid即可替换视频
    NSString *urlString1 = @"http://cv5.jikexueyuan.com/201607061055/9e9db87e3d4fdf49122ffe53b73203e3/course/3001-3100/3097/video/8923_b_h264_sd_960_540.mp4";
    
    self.videoURL = [NSURL URLWithString:urlString1];
    
    //2.playerView
    self.playerView = [[ZFPlayerView alloc]init];
    [self.view addSubview:self.playerView];
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.right.equalTo(self.view);
        make.height.equalTo(self.playerView.mas_width).multipliedBy(9.0f/16.0f).with.priority(HEIGHT);
    }];
    self.playerView.videoURL = self.videoURL;
    __weak typeof (self) weakSelf = self;
    self.playerView.goBackBlock = ^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
}
#pragma mark 创建头部工具栏
- (void)createHeaderToolbar{
    //1.创建父视图
    _headerToolbar = [[UIView alloc]init];
    _headerToolbar.frame = CGRectMake(0, 200, WIDTH, 32);
    //3.创建按钮
    NSArray *buttonTitleArray = @[@"目录",@"详情",@"相关课程"];
    for (int i = 0; i < 3; i++) {
        //添加button
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat space = 22;
        CGFloat width = (WIDTH - 22 * 4)/3.f;
        CGFloat x = space + i * (space + width);
        button.frame = CGRectMake(x, 0, width, 32);
        [button setTitle:buttonTitleArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor colorWithHexString:@"#484848"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"#35b558"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i + 100;
        if (i == 0) {
            //2.创建背景标签
            _buttonBackgroundImageView = [[UIImageView alloc]initWithFrame:button.frame];
            _buttonBackgroundImageView.image = [UIImage imageNamed:@"linebg_74x33_"];
            [_headerToolbar addSubview:_buttonBackgroundImageView];
            button.selected = YES;
            _oldButton = button;
        }
        [_headerToolbar addSubview:button];
    }
    [self.view addSubview:_headerToolbar];
}
#pragma mark button点击事件
- (void)selectedButton:(UIButton *)sender{
    [UIView animateWithDuration:0.3 animations:^{
        _buttonBackgroundImageView.center = CGPointMake(sender.center.x, sender.center.y);
    }];
    //2.改变CollectionView的Offset
    CGFloat x = (sender.tag - 100) * WIDTH;
    [_collectionView setContentOffset:CGPointMake(x, 0) animated:YES];
    
    if (sender.tag != _oldButton.tag) {
        _oldButton.selected = NO;
        sender.selected = !sender.selected;
    } else {
        sender.selected = YES;
    }
    _oldButton = sender;
}
#pragma mark 创建CollectionView
- (void)createCollectionView{
    //1.创建Layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0;//最小行间距
    flowLayout.minimumInteritemSpacing = 0;//每个单元格的左右间距
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滑动的方向
    flowLayout.itemSize = CGSizeMake(WIDTH, HEIGHT - 280);//单元格大小
    //2.创建 CollectionView
    CGFloat y = CGRectGetMaxY(_headerToolbar.frame);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, y, WIDTH, HEIGHT - 280) collectionViewLayout:flowLayout];
    //collectionView 跟TableView一样
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    _collectionView.pagingEnabled = YES;
    [_collectionView registerClass:[CourseDetailCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}
#pragma mark 获取数据
- (void)getDatasource{
    //1.获取数据
    _geekTool = [[GeekTool alloc]init];
    _geekTool.delegate = self;
    NSString *myUrlStr = @"http://api.jikexueyuan.com/v3/course/detail?api_key=sEc5qE9f&api_sig=1610a0923e79682bbcc9b1284d0435c4&channel=AppStore&cid=2582&from=2-10.0-4.2.1&nonce=641703&timestamp=1467642059&uid=4199754";
    [_geekTool getDatasourceWithUrlString:myUrlStr];
}
#pragma mark -
#pragma mark GeekDatasourceDelegate
- (void)geekTool:(GeekTool*)geekTool didGetDatasource:(NSDictionary*)dictionary{
    self.myModel = [CDMCourseDetailModel modelObjectWithDictionary:dictionary];
    if (self.myModel) {
        [self createCollectionView];
    }
}
#pragma mark - **************** CollectionView代理方法
#pragma mark 行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

#pragma mark 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CourseDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.dataModel = self.myModel.data;
    } else if (indexPath.row == 1) {
        cell.introModel = self.myModel.data.intro;
    } else if (indexPath.row == 2) {
        cell.dataModelRelated = self.myModel.data;
    }
    cell.layer.borderColor=[UIColor colorWithHexString:@"#d2d2d2"].CGColor;
    cell.layer.borderWidth=0.3;
    return cell;
}
#pragma mark 点击单元格
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}
#pragma mark 滑动改变button的状态
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentButtonTag = scrollView.contentOffset.x / WIDTH + 100;
    UIButton *button = [_headerToolbar viewWithTag:currentButtonTag];
    [self selectedButton:button];
}
@end












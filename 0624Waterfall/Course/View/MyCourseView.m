//
//  MyCourseView.m
//  0624Waterfall
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "MyCourseView.h"
#import "UIView+SDAutoLayout.h"
#import "CourseViewController.h"
#import "CoursePlayerViewController.h"

#import "AppDelegate.h"

@implementation MyCourseView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _smallImageView = [[UIImageView alloc]init];
        [self addSubview:_smallImageView];
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = [UIColor grayColor];
        [self addSubview:_titleLabel];
        
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.textColor = [UIColor grayColor];
        [self addSubview:_timeLabel];
        
        _studyNumLabel = [[UILabel alloc]init];
        _studyNumLabel.font = [UIFont systemFontOfSize:10];
        _studyNumLabel.textColor = [UIColor grayColor];
        [self addSubview:_studyNumLabel];
        //4.自动布局
        _smallImageView.sd_layout
        .heightIs(61)
        .widthIs(121);
        
        _titleLabel.sd_layout
        .topSpaceToView(_smallImageView,10)
        .heightIs(12)
        .widthIs(121);
        
        _timeLabel.sd_layout
        .topSpaceToView(_titleLabel,9)
        .widthIs(50)
        .heightIs(10);
        
        _studyNumLabel.sd_layout
        .topEqualToView(_timeLabel)
        .leftSpaceToView(_timeLabel,5)
        .rightSpaceToView(self,0)
        .heightIs(10);
        
        [self setupAutoHeightWithBottomView:self.studyNumLabel bottomMargin:0];
        
        //1.tap 点击
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
        tapGesture.numberOfTouchesRequired = 1;
        tapGesture.numberOfTapsRequired = 1;
        //将手势添加到需要识别的视图上
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}
- (void)tapGestureAction:(UITapGestureRecognizer *)tapGesture{
    //跳转到视频播放界面
    CourseViewController *vc = [self findViewController:self];
    CoursePlayerViewController *coursePlayerVC = [[CoursePlayerViewController alloc]init];
    [vc.navigationController pushViewController:coursePlayerVC animated:YES];
    NSLog(@"tap");
}
#pragma mark 找到当前View的Controller
- (CourseViewController *)findViewController:(UIView *)sourceView
{
    id target=sourceView;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[CourseViewController class]]) {
            break;
        }
    }
    return target;
}
@end


















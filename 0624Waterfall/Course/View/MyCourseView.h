//
//  MyCourseView.h
//  0624Waterfall
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 solar. All rights reserved.
//  *******************************课程里Scrollview中的单个ContentView（图片、标题、学习人数）

#import <UIKit/UIKit.h>

@interface MyCourseView : UIView
@property (strong,nonatomic)UIImageView *smallImageView;
@property (strong,nonatomic)UILabel *titleLabel;
@property (strong,nonatomic)UILabel *timeLabel;
@property (strong,nonatomic)UILabel *studyNumLabel;

@property (strong,nonatomic)NSString *avUrlString;

@end

//
//  SeriesView.h
//  0624Waterfall
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeriesView : UIView
/** imageApp*/
@property (strong,nonatomic)UIImageView *imageAppImageView;
/** studyCount*/
@property (strong,nonatomic)UILabel *studyCountLabel;
/** collectStatus*/
@property (assign,nonatomic)BOOL collectStatus;
/** 收藏按钮*/
@property (strong,nonatomic)UIButton *collectButton;
@end

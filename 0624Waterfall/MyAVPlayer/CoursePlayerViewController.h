//
//  CoursePlayerViewController.h
//  0624Waterfall
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZFPlayerView.h>
#import <Masonry.h>
#import "CDMCourseDetailModel.h"
#import "CDMData.h"
#import "CDMIntro.h"
#import "CDMLessons.h"
#import "CDMRelated.h"

#import "GeekTool.h"
#import "UIColor+Hex.h"

#import "CourseDetailCollectionViewCell.h"

@interface CoursePlayerViewController : UIViewController
@property(nonatomic,strong)CDMCourseDetailModel *myModel;
@property(nonatomic,strong)ZFPlayerView *playerView;
@property(nonatomic,strong)NSURL *videoURL;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic,strong)UIView *headerToolbar;

@end

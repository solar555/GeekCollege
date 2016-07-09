//
//  CostumTableViewCell.h
//  GetGeekDatasource
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 solar. All rights reserved.
//  *******************************顶部Scrollview轮番图片

#import <UIKit/UIKit.h>
#import "BMCourseBannerModal.h"
#import "BMData.h"
#import "BMLists.h"

@interface BannerTableViewCell : UITableViewCell

/** 顶部Scrollview*/
@property (nonatomic,strong)BMCourseBannerModal *bannerMadal;
@property (nonatomic, strong) UIImageView *bannerImageView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic,strong)NSMutableArray<UIImageView*> *imageViewArray;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)createScrollView;
@end

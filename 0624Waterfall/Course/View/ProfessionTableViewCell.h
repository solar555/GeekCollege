//
//  ProfessionTableViewCell.h
//  0624Waterfall
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMCourseProfessionModal.h"
#import "PMData.h"
#import "PMLists.h"
#import "ProfessionView.h"

@interface ProfessionTableViewCell : UITableViewCell
@property (nonatomic,strong)UIView *headView;

@property (nonatomic,strong)PMCourseProfessionModal *myMadal;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic,strong)NSMutableArray<ProfessionView*> *myCourseViewArray;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end

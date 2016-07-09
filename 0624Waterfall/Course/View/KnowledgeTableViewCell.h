//
//  KnowledgeTableViewCell.h
//  0624Waterfall
//
//  Created by mac on 16/6/29.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMCourseKnowledgeModal.h"
#import "KMData.h"
#import "KMLists.h"
#import "KnowledgeView.h"

@interface KnowledgeTableViewCell : UITableViewCell
@property (nonatomic,strong)UIView *headView;

@property (nonatomic,strong)KMCourseKnowledgeModal *myMadal;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic,strong)NSMutableArray<KnowledgeView*> *myCourseViewArray;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end

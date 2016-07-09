//
//  MyTableViewCell.h
//  0624Waterfall
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 solar. All rights reserved.
//  *******************************我的推荐

#import <UIKit/UIKit.h>
#import "MMCourseMyModal.h"
#import "MMCourse.h"
#import "MMData.h"
#import "MyCourseView.h"

@interface MyTableViewCell : UITableViewCell
@property (nonatomic,strong)UIView *headView;

@property (nonatomic,strong)MMCourseMyModal *myMadal;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic,strong)NSMutableArray<MyCourseView*> *myCourseViewArray;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)createScrollView;
@end

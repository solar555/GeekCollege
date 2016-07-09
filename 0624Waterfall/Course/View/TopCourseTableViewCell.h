//
//  TopCourseTableViewCell.h
//  0624Waterfall
//
//  Created by mac on 16/6/29.
//  Copyright © 2016年 solar. All rights reserved.
//  *******************************最新课程、免费课程

#import <UIKit/UIKit.h>
#import "TMCourseTopModal.h"
#import "TMCourse.h"
#import "TMData.h"
#import "TMLists.h"
#import "MyCourseView.h"

@interface TopCourseTableViewCell : UITableViewCell
@property (nonatomic,strong)UIView *headView;
/** 顶部Scrollview*/
@property (nonatomic,strong)TMCourseTopModal *myMadal;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic,strong)NSMutableArray<MyCourseView*> *myCourseViewArray;
/** 单元格索引*/
@property (nonatomic, assign)NSInteger *myIndex;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)createScrollView;

@end

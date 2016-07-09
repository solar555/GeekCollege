//
//  CourseListTableViewCell.h
//  0624Waterfall
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLMCourseListModel.h"
#import "CLMData.h"
#import "CLMLists.h"

@interface CourseListTableViewCell : UITableViewCell
@property(nonatomic,strong)CLMLists *listModel;

@property (nonatomic,strong)UIImageView *imgImageView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIImageView *timeImageView;
@property (nonatomic,strong)UILabel *lessonCountLabel;
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *studyNumLabel;
@end

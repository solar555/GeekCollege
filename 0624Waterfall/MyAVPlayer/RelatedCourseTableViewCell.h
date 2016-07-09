//
//  RelatedCourseTableViewCell.h
//  0624Waterfall
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDMData.h"
#import "CDMLessons.h"
#import "CDMIntro.h"
#import "CDMRelated.h"

@interface RelatedCourseTableViewCell : UITableViewCell
@property (nonatomic,strong)CDMRelated *relatedModel;

@property (nonatomic,strong)UIImageView *imgImageView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIImageView *timeImageView;
@property (nonatomic,strong)UILabel *lessonCountLabel;
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *studyNumLabel;

@end

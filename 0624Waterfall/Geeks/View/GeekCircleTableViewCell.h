//
//  GeekCircleTableViewCell.h
//  0624Waterfall
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeekCircleMessageView.h"
#import "GeekCircleCourseView.h"
#import "GeekCircleOperationView.h"

#import "GCMList.h"
#import "GCMDetail.h"

@interface GeekCircleTableViewCell : UITableViewCell
@property (nonatomic,strong)GCMList *geekList;

//MessageView
@property (strong,nonatomic)UIImageView *avatarImageView;
@property (strong,nonatomic)UILabel *unameLabel;
@property (strong,nonatomic)UILabel *positionLabel;
@property (strong,nonatomic)UILabel *createdAtLabel;
@property (strong,nonatomic)UILabel *descriptionLabel;
//CourseView
@property (strong,nonatomic)UIImageView *courseImageView;
@property (strong,nonatomic)UILabel *lessonNumberLabel;
@property (strong,nonatomic)UILabel *courseLengthLabel;
@property (strong,nonatomic)UILabel *learnNumberLabel;
@property (strong,nonatomic)UILabel *contributorLabel;
//OperationView
@property (strong,nonatomic)UIView *buttonView;

@property (strong,nonatomic)UIButton *likeNumberButton;
@property (strong,nonatomic)UIButton *commentNumberButton;
@property (strong,nonatomic)UIButton *likeButton;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
















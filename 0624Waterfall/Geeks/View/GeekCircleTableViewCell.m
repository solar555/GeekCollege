//
//  GeekCircleTableViewCell.m
//  0624Waterfall
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 solar. All rights reserved.
//
#define WIDTH self.contentView.size.width
#define HEIGHT self.contentView.size.height
#define SCROLLVIEW_HEIGHT 106

#import "GeekCircleTableViewCell.h"

#import "GeekTool.h"
#import "UIView+SDAutoLayout.h"
#import "UIColor+Hex.h"

#import "UIImageView+WebCache.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface GeekCircleTableViewCell ()<UIScrollViewAccessibilityDelegate,GeekDatasourceDelegate>
{
//    GeekTool *_geekTool;
}
@end

@implementation GeekCircleTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.设置消息视图
        [self setMessageView];
        //2.添加课程信息视图
        [self setCourseView];
        //3.添加操作按钮
        [self setOperationView];
        //4.设置自动布局
        [self setAutoLayout];
    }
    return self;
}
#pragma mark 设置消息视图（用户头像、用户名、用户对课程的描述等信息）
- (void)setMessageView{
    _avatarImageView = [[UIImageView alloc]init];
    
    _unameLabel = [[UILabel alloc]init];
    _unameLabel.font = [UIFont systemFontOfSize:13];
    _unameLabel.textColor = [UIColor blackColor];
    
    _positionLabel = [[UILabel alloc]init];
    _positionLabel.font = [UIFont systemFontOfSize:12];
    _positionLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    
    _createdAtLabel = [[UILabel alloc]init];
    _createdAtLabel.font = [UIFont systemFontOfSize:11];
    _createdAtLabel.textColor = [UIColor colorWithHexString:@"#9c9c9e"];
    
    _descriptionLabel = [[UILabel alloc]init];
    _descriptionLabel.font = [UIFont systemFontOfSize:12];
    _descriptionLabel.textColor = [UIColor colorWithHexString:@"#808080"];
    _descriptionLabel.numberOfLines = 0;
    
    [self.contentView sd_addSubviews:@[_avatarImageView,_unameLabel,_positionLabel,_createdAtLabel,_descriptionLabel]];
    
}
#pragma mark 设置课程信息视图（用户头像、用户名、用户对课程的描述等信息）
- (void)setCourseView{
    _courseImageView = [[UIImageView alloc]init];
    
    _lessonNumberLabel = [[UILabel alloc]init];
    _lessonNumberLabel.font = [UIFont systemFontOfSize:11];
    _lessonNumberLabel.textColor = [UIColor colorWithHexString:@"#9c9c9e"];
    
    _courseLengthLabel = [[UILabel alloc]init];
    _courseLengthLabel.font = [UIFont systemFontOfSize:11];
    _courseLengthLabel.textColor = [UIColor colorWithHexString:@"#9c9c9e"];
    
    _learnNumberLabel = [[UILabel alloc]init];
    _learnNumberLabel.font = [UIFont systemFontOfSize:11];
    _learnNumberLabel.textColor = [UIColor colorWithHexString:@"#9c9c9e"];
    
    _contributorLabel = [[UILabel alloc]init];
    _contributorLabel.font = [UIFont systemFontOfSize:11];
    _contributorLabel.textColor = [UIColor colorWithHexString:@"#9c9c9e"];
    _contributorLabel.numberOfLines = 0;
    
    [self.contentView sd_addSubviews:@[_courseImageView,_lessonNumberLabel,_courseLengthLabel,_learnNumberLabel,_contributorLabel]];
}
#pragma mark 设置操作按钮
- (void)setOperationView{
    //View(赞个数、评论、点赞)
    _buttonView = [[UIView alloc]init];
    //赞的个数
    _likeNumberButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_likeNumberButton setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    _likeNumberButton.titleLabel.font = [UIFont systemFontOfSize:12];
    //评论
    _commentNumberButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_commentNumberButton setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    _commentNumberButton.titleLabel.font = [UIFont systemFontOfSize:11];
    //点赞
    _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_likeButton setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    _likeButton.titleLabel.font = [UIFont systemFontOfSize:11];
    //添加到ButtonView上
    [self.contentView sd_addSubviews:@[_likeNumberButton,_commentNumberButton,_likeButton]];
}

#pragma mark 设置自动布局
- (void)setAutoLayout{
    //1.MessageView（用户头像、用户名、用户对课程的描述等信息）
    //头像
    _avatarImageView.sd_layout
    .topSpaceToView(self.contentView,12)
    .leftSpaceToView(self.contentView,10)
    .heightIs(36)
    .widthIs(36);
    //用户名
    _unameLabel.sd_layout
    .topEqualToView(_avatarImageView)
    .leftSpaceToView(_avatarImageView,10)
    .heightIs(13)
    .widthIs(100);
    //职位
    _positionLabel.sd_layout
    .topEqualToView(_avatarImageView)
    .leftSpaceToView(_avatarImageView,135)
    .heightIs(12)
    .widthIs(130);
    //学时
    _createdAtLabel.sd_layout
    .bottomEqualToView(_avatarImageView)
    .leftEqualToView(_unameLabel)
    .heightIs(11)
    .widthIs(200);
    //描述
    _descriptionLabel.sd_layout
    .topSpaceToView(_createdAtLabel,13)
    .leftEqualToView(_avatarImageView)
    .widthIs(320 - 20)
    .autoHeightRatio(0);
    
    //2.CourseView（课程信息：课时、学习人数、讲师等）
    //课程图片
    _courseImageView.sd_layout
    .topSpaceToView(_descriptionLabel,13)
    .leftEqualToView(_descriptionLabel)
    .widthIs(83)
    .heightIs(45);
    //课时
    _lessonNumberLabel.sd_layout
    .topEqualToView(_courseImageView)
    .leftSpaceToView(_courseImageView,10)
    .heightIs(11);
    [_lessonNumberLabel setSingleLineAutoResizeWithMaxWidth:50];
    //时间
    _courseLengthLabel.sd_layout
    .topEqualToView(_courseImageView)
    .leftSpaceToView(_lessonNumberLabel,5)
    .heightRatioToView(_lessonNumberLabel,1);
    [_courseLengthLabel setSingleLineAutoResizeWithMaxWidth:50];
    //学习人数
    _learnNumberLabel.sd_layout
    .topEqualToView(_courseImageView)
    .leftSpaceToView(_courseLengthLabel,5)
    .heightRatioToView(_lessonNumberLabel,1);
    [_learnNumberLabel setSingleLineAutoResizeWithMaxWidth:100];
    //讲师
    _contributorLabel.sd_layout
    .topSpaceToView(_learnNumberLabel,10)
    .leftEqualToView(_lessonNumberLabel)
    .heightRatioToView(_learnNumberLabel,1);
    [_contributorLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    //3.Operation（三个按钮）
    _buttonView.sd_layout
    .topSpaceToView(_courseImageView,11)
    .leftEqualToView(_courseImageView)
    .widthIs(320 - 20)
    .heightIs(26);
    //赞的个数
    _likeNumberButton.sd_layout
    .topSpaceToView(_courseImageView,8)
    .leftSpaceToView(self.contentView,30)
    .heightIs(12)
    .widthIs(40);
    //评论
    _commentNumberButton.sd_layout
    .topEqualToView(_likeNumberButton)
    .rightSpaceToView(self.contentView,83)
    .widthIs(43)
    .heightIs(14);
    //点赞
    _likeButton.sd_layout
    .topEqualToView(_likeNumberButton)
    .rightSpaceToView(self.contentView,23)
    .widthIs(38)
    .heightIs(14);
}

- (void)setGeekList:(GCMList *)geekList
{
    GCMUserInfo *userInfo = geekList.userInfo;
    //1.MessageView
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:userInfo.avatar]];
    _unameLabel.text = userInfo.uname;
    _positionLabel.text = [NSString stringWithFormat:@"| %@", userInfo.position];
    _createdAtLabel.text = geekList.createdAt;
    _descriptionLabel.text = geekList.desc;
    //2.CourseView
    GCMDetail *detail = geekList.detail;
    [_courseImageView sd_setImageWithURL:[NSURL URLWithString:detail.img]];
    _lessonNumberLabel.text = [NSString stringWithFormat:@"%.0lf课时",detail.lessonNum];
    _courseLengthLabel.text = [NSString stringWithFormat:@"%.0lf分",detail.courseLength];
    _learnNumberLabel.text = [NSString stringWithFormat:@"%@人学习", detail.learnNum];
    _contributorLabel.text = [NSString stringWithFormat:@"讲师：%@", detail.contributor];
    //3.ButtonView
    [_likeNumberButton setTitle:[NSString stringWithFormat:@"%.0lf个赞",geekList.likeNum] forState:UIControlStateNormal];
    [_commentNumberButton setTitle:@"评论" forState:UIControlStateNormal];
    [_commentNumberButton setImage:[UIImage imageNamed:@"comment_12x12_"] forState:UIControlStateNormal];
    UIEdgeInsets commentEdgeInsets = {0,-14,0,0};
    [_commentNumberButton setImageEdgeInsets:commentEdgeInsets];
    [_likeButton setTitle:@"赞" forState:UIControlStateNormal];
    [_likeButton setImage:[UIImage imageNamed:@"zan_12x12_"] forState:UIControlStateNormal];
    UIEdgeInsets likeEdgeInsets = {0,-14,0,0};
    [_likeButton setImageEdgeInsets:likeEdgeInsets];
    
    //***********************高度自适应cell设置步骤************************
    [self setupAutoHeightWithBottomView:_likeButton bottomMargin:10];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

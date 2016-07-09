//
//  CourseListTableViewCell.m
//  0624Waterfall
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "CourseListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+SDAutoLayout.h"

@implementation CourseListTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.创建控件
        [self createControl];
        //2.设置约束
        [self setAutoLayout];
    }
    return self;
}
#pragma mark 创建控件
- (void)createControl{
    _imgImageView = [[UIImageView alloc]init];
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _timeImageView = [[UIImageView alloc]init];
    _lessonCountLabel = [[UILabel alloc]init];
    _lessonCountLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _studyNumLabel = [[UILabel alloc]init];
    _studyNumLabel.font = [UIFont systemFontOfSize:10];
    
    [self.contentView sd_addSubviews:@[_imgImageView,_titleLabel,_timeImageView,_lessonCountLabel,_timeLabel,_studyNumLabel]];
}
#pragma mark 设置约束
- (void)setAutoLayout{
    _imgImageView.sd_layout
    .heightIs(75)
    .widthIs(140);
    
    _titleLabel.sd_layout
    .topSpaceToView(self.contentView,20)
    .leftSpaceToView(_imgImageView,10)
    .heightIs(12);
    [_titleLabel setSingleLineAutoResizeWithMaxWidth:180];
    
    _timeImageView.sd_layout
    .topSpaceToView(_titleLabel,20)
    .leftEqualToView(_titleLabel)
    .widthIs(12)
    .heightIs(12);
    
    _lessonCountLabel.sd_layout
    .topEqualToView(_timeImageView)
    .leftSpaceToView(_timeImageView,5)
    .heightIs(12);
    [_lessonCountLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    _studyNumLabel.sd_layout
    .topEqualToView(_timeImageView)
    .rightSpaceToView(self.contentView,5)
    .heightIs(10);
    [_studyNumLabel setSingleLineAutoResizeWithMaxWidth:100];
}

- (void)setListModel:(CLMLists *)listModel{
    _listModel = listModel;
    [_imgImageView sd_setImageWithURL:[NSURL URLWithString:listModel.img]];
    _titleLabel.text = listModel.title;
    _timeImageView.image = [UIImage imageNamed:@"ic_time_icon_12x12_"];
    _lessonCountLabel.text = [NSString stringWithFormat:@"%.0lf课时，%.0lf分钟",listModel.lessonCount,listModel.time];
    _studyNumLabel.text = [NSString stringWithFormat:@"%.0lf人学习",listModel.studyNum];
    //    [self.contentView setupAutoHeightWithBottomView:_imgImageView bottomMargin:0];
    
    //***********************高度自适应cell设置步骤************************
    [self setupAutoHeightWithBottomView:_imgImageView bottomMargin:0];
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

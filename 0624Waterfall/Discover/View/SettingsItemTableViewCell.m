//
//  SettingsItemTableViewCell.m
//  0624Waterfall
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "SettingsItemTableViewCell.h"
#import "GeekTool.h"
#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@implementation SettingsItemTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.添加控件
        [self addCotroller];
        //2.设置自动布局
        [self setAutoLayout];
    }
    return self;
}
#pragma mark 添加控件
- (void)addCotroller{
    _cellImageView = [[UIImageView alloc]init];
    _cellTextLabel = [[UILabel alloc]init];
    _cellTextLabel.font = [UIFont systemFontOfSize:13];
    _cellDetailLabel = [[UILabel alloc]init];
    _cellDetailLabel.font = [UIFont systemFontOfSize:13];
    _accessoryImageView = [[UIImageView alloc]init];
    
    [self.contentView sd_addSubviews:@[_cellImageView,_cellTextLabel,_cellDetailLabel,_accessoryImageView]];

}
#pragma mark 设置自动布局
- (void)setAutoLayout{
    
    _cellImageView.sd_layout
    .topSpaceToView(self.contentView,13)
    .leftSpaceToView(self.contentView,13)
    .widthIs(20)
    .heightIs(20);
    
    _cellTextLabel.sd_layout
    .topSpaceToView(self.contentView,17)
    .leftSpaceToView(_cellImageView,12)
    .heightIs(12);
    [_cellTextLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    _cellDetailLabel.sd_layout
    .topEqualToView(_cellTextLabel)
    .rightSpaceToView(self.contentView,30)
    .heightIs(12);
    [_cellDetailLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    _accessoryImageView.sd_layout
    .topEqualToView(_cellDetailLabel)
    .rightSpaceToView(self.contentView,15)
    .heightIs(12)
    .widthIs(12);
}

- (void)setCellModel:(CellModel *)cellModel
{
    _cellImageView.image = [UIImage imageNamed:cellModel.cellImageView];
    _cellTextLabel.text = cellModel.cellTextLabel;
    
    //***********************高度自适应cell设置步骤************************
    [self setupAutoHeightWithBottomView:_cellImageView bottomMargin:10];
}

- (void)setMineViewCellModel:(CellModel *)cellModel
{
    _cellImageView.image = [UIImage imageNamed:cellModel.cellImageView];
    _cellTextLabel.text = cellModel.cellTextLabel;
    _cellDetailLabel.text = cellModel.cellDetailLabel;
    _accessoryImageView.image = [UIImage imageNamed:cellModel.accessoryImageView];
    
    //***********************高度自适应cell设置步骤************************
    [self setupAutoHeightWithBottomView:_cellImageView bottomMargin:10];
}
- (void)setVipCellModel:(CellModel *)vipCellModel{
    _cellImageView.sd_layout
    .topSpaceToView(self.contentView,13)
    .leftSpaceToView(self.contentView,13)
    .widthIs(0)
    .heightIs(20);
    
    _cellTextLabel.text = vipCellModel.cellTextLabel;
    _cellDetailLabel.text = vipCellModel.cellDetailLabel;
    _accessoryImageView.image = [UIImage imageNamed:vipCellModel.accessoryImageView];
    //***********************高度自适应cell设置步骤************************
    [self setupAutoHeightWithBottomView:_cellDetailLabel bottomMargin:10];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end














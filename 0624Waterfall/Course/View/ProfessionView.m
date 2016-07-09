//
//  ProfessionView.m
//  0624Waterfall
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "ProfessionView.h"
#import "UIView+SDAutoLayout.h"
#import "UIColor+Hex.h"

@implementation ProfessionView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        _indexImageView = [[UIImageView alloc]init];
        [self addSubview:_indexImageView];
        
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor colorWithHexString:@"#767676"];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLabel];
        
        _indexDesc1Label = [[UILabel alloc]init];
        _indexDesc1Label.font = [UIFont systemFontOfSize:12];
        _indexDesc1Label.textColor = [UIColor colorWithHexString:@"#6c6c6c"];
        _indexDesc1Label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_indexDesc1Label];
        
        _indexDesc2Label = [[UILabel alloc]init];
        _indexDesc2Label.font = [UIFont systemFontOfSize:12];
        _indexDesc2Label.textColor = [UIColor colorWithHexString:@"#6c6c6c"];
        _indexDesc2Label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_indexDesc2Label];
        
        _studyLabel = [[UILabel alloc]init];
        _studyLabel.font = [UIFont systemFontOfSize:13];
        _studyLabel.textColor = [UIColor colorWithHexString:@"#def3e4"];
        _studyLabel.backgroundColor = [UIColor colorWithHexString:@"#35b558"];
        _studyLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_studyLabel];
        //4.自动布局
        _indexImageView.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(self,10)
        .heightIs(80)
        .widthIs(130);
        
        _nameLabel.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(_indexImageView,20)
        .heightIs(14)
        .widthIs(160);
        
        _indexDesc1Label.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(_nameLabel,14)
        .heightIs(12)
        .widthIs(160);
        
        _indexDesc2Label.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(_indexDesc1Label,4)
        .heightIs(12)
        .widthIs(160);
        
        _studyLabel.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(_indexDesc2Label,11)
        .heightIs(25)
        .widthIs(80);
        
        [self setupAutoHeightWithBottomView:self.studyLabel bottomMargin:8];
    }
    return self;
}


@end

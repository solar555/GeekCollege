//
//  GeekCircleMessageView.m
//  0624Waterfall
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "GeekCircleMessageView.h"
#import "UIView+SDAutoLayout.h"
#import "UIColor+Hex.h"
#import "UIImageView+WebCache.h"

@implementation GeekCircleMessageView
- (instancetype)init:(GCMList*)geekList{
    self = [super init];
    if (self) {
        self.geekList = geekList;
        GCMUserInfo *userInfo = _geekList.userInfo;
        
        _avatarImageView = [[UIImageView alloc]init];
        [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:userInfo.avatar]];
        [self addSubview:_avatarImageView];
        
        _unameLabel = [[UILabel alloc]init];
        _unameLabel.font = [UIFont systemFontOfSize:13];
        _unameLabel.textColor = [UIColor blackColor];
        _unameLabel.text = userInfo.uname;
        [self addSubview:_unameLabel];
        
        _positionLabel = [[UILabel alloc]init];
        _positionLabel.font = [UIFont systemFontOfSize:12];
        _positionLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _positionLabel.text = userInfo.position;
        [self addSubview:_positionLabel];
        
        _createdAtLabel = [[UILabel alloc]init];
        _createdAtLabel.font = [UIFont systemFontOfSize:11];
        _createdAtLabel.textColor = [UIColor colorWithHexString:@"#9c9c9e"];
        _createdAtLabel.text = _geekList.createdAt;
        [self addSubview:_createdAtLabel];
        
        _descriptionLabel = [[UILabel alloc]init];
        _descriptionLabel.font = [UIFont systemFontOfSize:12];
        _descriptionLabel.textColor = [UIColor colorWithHexString:@"#808080"];
        _descriptionLabel.text = _geekList.desc;
        _descriptionLabel.numberOfLines = 0;
        [self addSubview:_descriptionLabel];
        
        //4.自动布局
        _avatarImageView.sd_layout
        .topSpaceToView(self,12)
        .leftSpaceToView(self,10)
        .heightIs(36)
        .widthIs(36);
        
        _unameLabel.sd_layout
        .topEqualToView(_avatarImageView)
        .leftSpaceToView(_avatarImageView,10)
        .heightIs(13)
        .widthIs(100);
        
        _positionLabel.sd_layout
        .topEqualToView(_avatarImageView)
        .leftSpaceToView(_avatarImageView,135)
        .heightIs(12)
        .widthIs(130);
        
        _createdAtLabel.sd_layout
        .bottomEqualToView(_avatarImageView)
        .leftEqualToView(_unameLabel)
        .heightIs(11)
        .widthIs(200);
        
        //根据文字高度改变label高度
        CGRect textFrame = [_geekList.desc boundingRectWithSize:CGSizeMake(320 - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
        CGFloat textHeight = CGRectGetHeight(textFrame);
        _descriptionLabel.frame = textFrame;
        NSLog(@"%@",NSStringFromCGRect(_descriptionLabel.frame));
        
        _descriptionLabel.sd_layout
        .topSpaceToView(_createdAtLabel,13)
        .leftEqualToView(_avatarImageView)
        .widthIs(320 - 20)
        .heightIs(textHeight)
        .bottomSpaceToView(self,10);
        
        [self setupAutoHeightWithBottomView:self.descriptionLabel bottomMargin:10];
    }
    return self;

}
//- (instancetype)initWithFrame:(CGRect)frame withModel:(GCMList*)geekList{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.geekList = geekList;
//        GCMUserInfo *userInfo = _geekList.userInfo;
//        
//        _avatarImageView = [[UIImageView alloc]init];
////        [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:userInfo.avatar]];
//        [self addSubview:_avatarImageView];
//        
//        _unameLabel = [[UILabel alloc]init];
//        _unameLabel.font = [UIFont systemFontOfSize:13];
//        _unameLabel.textColor = [UIColor blackColor];
////        _unameLabel.text = userInfo.uname;
//        [self addSubview:_unameLabel];
//        
//        _positionLabel = [[UILabel alloc]init];
//        _positionLabel.font = [UIFont systemFontOfSize:12];
//        _positionLabel.textColor = [UIColor colorWithHexString:@"#999999"];
////        _positionLabel.text = userInfo.position;
//        [self addSubview:_positionLabel];
//        
//        _createdAtLabel = [[UILabel alloc]init];
//        _createdAtLabel.font = [UIFont systemFontOfSize:11];
//        _createdAtLabel.textColor = [UIColor colorWithHexString:@"#9c9c9e"];
////        _createdAtLabel.text = _geekList.createdAt;
//        [self addSubview:_createdAtLabel];
//        
//        _descriptionLabel = [[UILabel alloc]init];
//        _descriptionLabel.font = [UIFont systemFontOfSize:12];
//        _descriptionLabel.textColor = [UIColor colorWithHexString:@"#808080"];
//        _descriptionLabel.text = _geekList.desc;
//        _descriptionLabel.numberOfLines = 0;
//        [self addSubview:_descriptionLabel];
//        //4.自动布局
//        _avatarImageView.sd_layout
//        .topSpaceToView(self,12)
//        .leftSpaceToView(self,10)
//        .heightIs(36)
//        .widthIs(36);
//        
//        _unameLabel.sd_layout
//        .topEqualToView(_avatarImageView)
//        .leftSpaceToView(_avatarImageView,10)
//        .heightIs(13)
//        .widthIs(100);
//        
//        _positionLabel.sd_layout
//        .topEqualToView(_avatarImageView)
//        .leftSpaceToView(_avatarImageView,135)
//        .heightIs(12)
//        .widthIs(130);
//        
//        _createdAtLabel.sd_layout
//        .bottomEqualToView(_avatarImageView)
//        .leftEqualToView(_unameLabel)
//        .heightIs(11)
//        .widthIs(200);
//        
//        //根据文字高度改变label高度
//        CGRect textFrame = [_geekList.desc boundingRectWithSize:CGSizeMake(320 - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
//        
//        _descriptionLabel.sd_layout
//        .topSpaceToView(_avatarImageView,13)
//        .leftEqualToView(_avatarImageView)
//        .widthIs(320 - 20)
//        .heightIs(textFrame.size.height);
//        
//        [self setupAutoHeightWithBottomView:self.descriptionLabel bottomMargin:0];
//    }
//    return self;
//}


@end

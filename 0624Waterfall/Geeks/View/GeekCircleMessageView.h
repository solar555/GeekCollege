//
//  GeekCircleMessageView.h
//  0624Waterfall
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCMList.h"
#import "GCMUserInfo.h"

@interface GeekCircleMessageView : UIView

@property (nonatomic,strong)GCMList *geekList;

@property (strong,nonatomic)UIImageView *avatarImageView;
@property (strong,nonatomic)UILabel *unameLabel;
@property (strong,nonatomic)UILabel *positionLabel;
@property (strong,nonatomic)UILabel *createdAtLabel;
@property (strong,nonatomic)UILabel *descriptionLabel;
- (instancetype)initWithFrame:(CGRect)frame withModel:(GCMList*)geekList;
- (instancetype)init:(GCMList*)geekList;
@end

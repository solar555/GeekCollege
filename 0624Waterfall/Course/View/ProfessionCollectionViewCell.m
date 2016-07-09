//
//  ProfessionCollectionViewCell.m
//  0624Waterfall
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "ProfessionCollectionViewCell.h"

@implementation ProfessionCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.professionView = [[ProfessionView alloc]initWithFrame:CGRectMake(0, 0, 160, 215)];
        [self.contentView addSubview:self.professionView];
    }
    return self;
}
@end

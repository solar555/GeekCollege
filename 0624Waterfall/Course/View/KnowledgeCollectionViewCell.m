//
//  KnowledgeCollectionViewCell.m
//  0624Waterfall
//
//  Created by mac on 16/6/29.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "KnowledgeCollectionViewCell.h"

@implementation KnowledgeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.knowledgeView = [[KnowledgeView alloc]initWithFrame:CGRectMake(0, 0, 106, 113)];
        [self.contentView addSubview:self.knowledgeView];
    }
    return self;
}
@end

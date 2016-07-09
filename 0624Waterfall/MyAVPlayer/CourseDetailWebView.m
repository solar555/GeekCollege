//
//  CourseDetailWebView.m
//  0624Waterfall
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "CourseDetailWebView.h"

@implementation CourseDetailWebView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setDataModel:(CDMData *)dataModel{
    _dataModel = dataModel;
    NSString *courseIntro = dataModel.intro.courseIntro;
    [self loadHTMLString:courseIntro baseURL:nil];
}

- (void)setIntroModel:(CDMIntro *)introModel{
    _introModel = introModel;
    NSString *courseIntro = introModel.courseIntro;
    [self loadHTMLString:courseIntro baseURL:nil];
}


@end

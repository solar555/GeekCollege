//
//  UINavigationBar+BackgroundColor.h
//  0624Waterfall
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UINavigationBar (BackgroundColor)
- (void)lt_setBackgroundColor:(UIColor *)backgroundColor;
- (void)lt_resetBackgroundColor;
@end

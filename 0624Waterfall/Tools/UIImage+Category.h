//
//  UIImage+Category.h
//  Jokes
//
//  Created by mac on 16/6/26.
//  Copyright © 2016年 nursen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

// 加载最原始的图片，没有渲染
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

+ (instancetype)imageWithStretchableName:(NSString *)imageName;

@end

//
//  GetDatasource.h
//  GetGeekDatasource
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class GeekTool;
@protocol GeekDatasourceDelegate <NSObject>

@optional

//获得数据
- (void)geekTool:(GeekTool*)geekTool didGetDatasource:(NSDictionary*)dictionary;
//获得error
- (void)geekTool:(GeekTool*)sinaTool didFailedWithError:(NSError*)error;

//专门用于获取课程库中的菜单数据
//获得数据
- (void)geekTool:(GeekTool*)geekTool didGetDatasource1:(NSDictionary*)dictionary;
//获得error
- (void)geekTool:(GeekTool*)sinaTool didFailedWithError1:(NSError*)error;
//Unicode转中文
- (NSString *)replaceUnicode:(NSString *)unicodeStr;

@end


@interface GeekTool : NSObject
@property (assign,nonatomic)id<GeekDatasourceDelegate> delegate;
- (void)getDatasourceWithUrlString:(NSString *)urlString;
- (void)getDatasourceWithUrlString1:(NSString *)urlString;

@end

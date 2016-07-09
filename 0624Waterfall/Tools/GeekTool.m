//
//  GetDatasource.m
//  GetGeekDatasource
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "GeekTool.h"
#import "BMCourseBannerModal.h"
#import "BMData.h"

@implementation GeekTool
- (void)getDatasourceWithUrlString:(NSString *)urlString{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    __block id blockDelegate = _delegate;
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([blockDelegate respondsToSelector:@selector(geekTool:didGetDatasource:)]) {
            
            [blockDelegate geekTool:self didGetDatasource:responseObject];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
        //传递error
        if ([blockDelegate respondsToSelector:@selector(geekTool: didFailedWithError:)]) {
            
            [blockDelegate geekTool:self didFailedWithError:error];
        }
        
    }];
}
- (void)getDatasourceWithUrlString1:(NSString *)urlString{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    __block id blockDelegate = _delegate;
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([blockDelegate respondsToSelector:@selector(geekTool:didGetDatasource1:)]) {
            
            [blockDelegate geekTool:self didGetDatasource1:responseObject];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
        //传递error
        if ([blockDelegate respondsToSelector:@selector(geekTool: didFailedWithError:)]) {
            
            [blockDelegate geekTool:self didFailedWithError:error];
        }
        
    }];
}
- (NSString *)replaceUnicode:(NSString *)unicodeStr{
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}
@end















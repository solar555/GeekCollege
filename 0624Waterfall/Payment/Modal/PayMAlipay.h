//
//  PayMAlipay.h
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PayMAlipay : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *payName;
@property (nonatomic, strong) NSString *notifyUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

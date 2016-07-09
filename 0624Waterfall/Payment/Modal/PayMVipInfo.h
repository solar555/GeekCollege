//
//  PayMVipInfo.h
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PayMYears, PayMMonths;

@interface PayMVipInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) PayMYears *years;
@property (nonatomic, strong) PayMMonths *months;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

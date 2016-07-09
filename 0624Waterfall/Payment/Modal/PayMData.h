//
//  PayMData.h
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PayMPaymentType, PayMVipInfo;

@interface PayMData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) PayMPaymentType *paymentType;
@property (nonatomic, strong) PayMVipInfo *vipInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

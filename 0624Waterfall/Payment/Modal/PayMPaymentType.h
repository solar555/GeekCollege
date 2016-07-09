//
//  PayMPaymentType.h
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PayMAlipay, PayMIap;

@interface PayMPaymentType : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) PayMAlipay *alipay;
@property (nonatomic, strong) PayMIap *iap;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

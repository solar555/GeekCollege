//
//  PayMData.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PayMData.h"
#import "PayMPaymentType.h"
#import "PayMVipInfo.h"


NSString *const kPayMDataPaymentType = @"payment_type";
NSString *const kPayMDataVipInfo = @"vip_info";


@interface PayMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PayMData

@synthesize paymentType = _paymentType;
@synthesize vipInfo = _vipInfo;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.paymentType = [PayMPaymentType modelObjectWithDictionary:[dict objectForKey:kPayMDataPaymentType]];
            self.vipInfo = [PayMVipInfo modelObjectWithDictionary:[dict objectForKey:kPayMDataVipInfo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.paymentType dictionaryRepresentation] forKey:kPayMDataPaymentType];
    [mutableDict setValue:[self.vipInfo dictionaryRepresentation] forKey:kPayMDataVipInfo];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.paymentType = [aDecoder decodeObjectForKey:kPayMDataPaymentType];
    self.vipInfo = [aDecoder decodeObjectForKey:kPayMDataVipInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_paymentType forKey:kPayMDataPaymentType];
    [aCoder encodeObject:_vipInfo forKey:kPayMDataVipInfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    PayMData *copy = [[PayMData alloc] init];
    
    if (copy) {

        copy.paymentType = [self.paymentType copyWithZone:zone];
        copy.vipInfo = [self.vipInfo copyWithZone:zone];
    }
    
    return copy;
}


@end

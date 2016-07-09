//
//  PayMPaymentType.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PayMPaymentType.h"
#import "PayMAlipay.h"
#import "PayMIap.h"


NSString *const kPayMPaymentTypeAlipay = @"alipay";
NSString *const kPayMPaymentTypeIap = @"iap";


@interface PayMPaymentType ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PayMPaymentType

@synthesize alipay = _alipay;
@synthesize iap = _iap;


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
            self.alipay = [PayMAlipay modelObjectWithDictionary:[dict objectForKey:kPayMPaymentTypeAlipay]];
            self.iap = [PayMIap modelObjectWithDictionary:[dict objectForKey:kPayMPaymentTypeIap]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.alipay dictionaryRepresentation] forKey:kPayMPaymentTypeAlipay];
    [mutableDict setValue:[self.iap dictionaryRepresentation] forKey:kPayMPaymentTypeIap];

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

    self.alipay = [aDecoder decodeObjectForKey:kPayMPaymentTypeAlipay];
    self.iap = [aDecoder decodeObjectForKey:kPayMPaymentTypeIap];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_alipay forKey:kPayMPaymentTypeAlipay];
    [aCoder encodeObject:_iap forKey:kPayMPaymentTypeIap];
}

- (id)copyWithZone:(NSZone *)zone
{
    PayMPaymentType *copy = [[PayMPaymentType alloc] init];
    
    if (copy) {

        copy.alipay = [self.alipay copyWithZone:zone];
        copy.iap = [self.iap copyWithZone:zone];
    }
    
    return copy;
}


@end

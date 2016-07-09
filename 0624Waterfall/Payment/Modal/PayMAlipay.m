//
//  PayMAlipay.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PayMAlipay.h"


NSString *const kPayMAlipayPayName = @"pay_name";
NSString *const kPayMAlipayNotifyUrl = @"notify_url";


@interface PayMAlipay ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PayMAlipay

@synthesize payName = _payName;
@synthesize notifyUrl = _notifyUrl;


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
            self.payName = [self objectOrNilForKey:kPayMAlipayPayName fromDictionary:dict];
            self.notifyUrl = [self objectOrNilForKey:kPayMAlipayNotifyUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.payName forKey:kPayMAlipayPayName];
    [mutableDict setValue:self.notifyUrl forKey:kPayMAlipayNotifyUrl];

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

    self.payName = [aDecoder decodeObjectForKey:kPayMAlipayPayName];
    self.notifyUrl = [aDecoder decodeObjectForKey:kPayMAlipayNotifyUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_payName forKey:kPayMAlipayPayName];
    [aCoder encodeObject:_notifyUrl forKey:kPayMAlipayNotifyUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    PayMAlipay *copy = [[PayMAlipay alloc] init];
    
    if (copy) {

        copy.payName = [self.payName copyWithZone:zone];
        copy.notifyUrl = [self.notifyUrl copyWithZone:zone];
    }
    
    return copy;
}


@end

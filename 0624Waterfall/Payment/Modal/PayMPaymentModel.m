//
//  PayMPaymentModel.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PayMPaymentModel.h"
#import "PayMData.h"


NSString *const kPayMPaymentModelMsg = @"msg";
NSString *const kPayMPaymentModelData = @"data";
NSString *const kPayMPaymentModelCode = @"code";


@interface PayMPaymentModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PayMPaymentModel

@synthesize msg = _msg;
@synthesize data = _data;
@synthesize code = _code;


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
            self.msg = [self objectOrNilForKey:kPayMPaymentModelMsg fromDictionary:dict];
            self.data = [PayMData modelObjectWithDictionary:[dict objectForKey:kPayMPaymentModelData]];
            self.code = [[self objectOrNilForKey:kPayMPaymentModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kPayMPaymentModelMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kPayMPaymentModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kPayMPaymentModelCode];

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

    self.msg = [aDecoder decodeObjectForKey:kPayMPaymentModelMsg];
    self.data = [aDecoder decodeObjectForKey:kPayMPaymentModelData];
    self.code = [aDecoder decodeDoubleForKey:kPayMPaymentModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kPayMPaymentModelMsg];
    [aCoder encodeObject:_data forKey:kPayMPaymentModelData];
    [aCoder encodeDouble:_code forKey:kPayMPaymentModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    PayMPaymentModel *copy = [[PayMPaymentModel alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

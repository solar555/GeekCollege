//
//  PayMMonths.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PayMMonths.h"


NSString *const kPayMMonthsActivity = @"activity";
NSString *const kPayMMonthsSubject = @"subject";
NSString *const kPayMMonthsPrice = @"price";
NSString *const kPayMMonthsUnit = @"unit";
NSString *const kPayMMonthsDesc = @"desc";


@interface PayMMonths ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PayMMonths

@synthesize activity = _activity;
@synthesize subject = _subject;
@synthesize price = _price;
@synthesize unit = _unit;
@synthesize desc = _desc;


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
            self.activity = [self objectOrNilForKey:kPayMMonthsActivity fromDictionary:dict];
            self.subject = [self objectOrNilForKey:kPayMMonthsSubject fromDictionary:dict];
            self.price = [self objectOrNilForKey:kPayMMonthsPrice fromDictionary:dict];
            self.unit = [self objectOrNilForKey:kPayMMonthsUnit fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPayMMonthsDesc fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.activity forKey:kPayMMonthsActivity];
    [mutableDict setValue:self.subject forKey:kPayMMonthsSubject];
    [mutableDict setValue:self.price forKey:kPayMMonthsPrice];
    [mutableDict setValue:self.unit forKey:kPayMMonthsUnit];
    [mutableDict setValue:self.desc forKey:kPayMMonthsDesc];

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

    self.activity = [aDecoder decodeObjectForKey:kPayMMonthsActivity];
    self.subject = [aDecoder decodeObjectForKey:kPayMMonthsSubject];
    self.price = [aDecoder decodeObjectForKey:kPayMMonthsPrice];
    self.unit = [aDecoder decodeObjectForKey:kPayMMonthsUnit];
    self.desc = [aDecoder decodeObjectForKey:kPayMMonthsDesc];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_activity forKey:kPayMMonthsActivity];
    [aCoder encodeObject:_subject forKey:kPayMMonthsSubject];
    [aCoder encodeObject:_price forKey:kPayMMonthsPrice];
    [aCoder encodeObject:_unit forKey:kPayMMonthsUnit];
    [aCoder encodeObject:_desc forKey:kPayMMonthsDesc];
}

- (id)copyWithZone:(NSZone *)zone
{
    PayMMonths *copy = [[PayMMonths alloc] init];
    
    if (copy) {

        copy.activity = [self.activity copyWithZone:zone];
        copy.subject = [self.subject copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.unit = [self.unit copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
    }
    
    return copy;
}


@end

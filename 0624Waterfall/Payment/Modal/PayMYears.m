//
//  PayMYears.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PayMYears.h"


NSString *const kPayMYearsActivity = @"activity";
NSString *const kPayMYearsSubject = @"subject";
NSString *const kPayMYearsPrice = @"price";
NSString *const kPayMYearsUnit = @"unit";
NSString *const kPayMYearsDesc = @"desc";


@interface PayMYears ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PayMYears

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
            self.activity = [self objectOrNilForKey:kPayMYearsActivity fromDictionary:dict];
            self.subject = [self objectOrNilForKey:kPayMYearsSubject fromDictionary:dict];
            self.price = [self objectOrNilForKey:kPayMYearsPrice fromDictionary:dict];
            self.unit = [self objectOrNilForKey:kPayMYearsUnit fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPayMYearsDesc fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.activity forKey:kPayMYearsActivity];
    [mutableDict setValue:self.subject forKey:kPayMYearsSubject];
    [mutableDict setValue:self.price forKey:kPayMYearsPrice];
    [mutableDict setValue:self.unit forKey:kPayMYearsUnit];
    [mutableDict setValue:self.desc forKey:kPayMYearsDesc];

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

    self.activity = [aDecoder decodeObjectForKey:kPayMYearsActivity];
    self.subject = [aDecoder decodeObjectForKey:kPayMYearsSubject];
    self.price = [aDecoder decodeObjectForKey:kPayMYearsPrice];
    self.unit = [aDecoder decodeObjectForKey:kPayMYearsUnit];
    self.desc = [aDecoder decodeObjectForKey:kPayMYearsDesc];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_activity forKey:kPayMYearsActivity];
    [aCoder encodeObject:_subject forKey:kPayMYearsSubject];
    [aCoder encodeObject:_price forKey:kPayMYearsPrice];
    [aCoder encodeObject:_unit forKey:kPayMYearsUnit];
    [aCoder encodeObject:_desc forKey:kPayMYearsDesc];
}

- (id)copyWithZone:(NSZone *)zone
{
    PayMYears *copy = [[PayMYears alloc] init];
    
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

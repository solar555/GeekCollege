//
//  PayMVipInfo.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PayMVipInfo.h"
#import "PayMYears.h"
#import "PayMMonths.h"


NSString *const kPayMVipInfoYears = @"years";
NSString *const kPayMVipInfoMonths = @"months";


@interface PayMVipInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PayMVipInfo

@synthesize years = _years;
@synthesize months = _months;


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
            self.years = [PayMYears modelObjectWithDictionary:[dict objectForKey:kPayMVipInfoYears]];
            self.months = [PayMMonths modelObjectWithDictionary:[dict objectForKey:kPayMVipInfoMonths]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.years dictionaryRepresentation] forKey:kPayMVipInfoYears];
    [mutableDict setValue:[self.months dictionaryRepresentation] forKey:kPayMVipInfoMonths];

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

    self.years = [aDecoder decodeObjectForKey:kPayMVipInfoYears];
    self.months = [aDecoder decodeObjectForKey:kPayMVipInfoMonths];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_years forKey:kPayMVipInfoYears];
    [aCoder encodeObject:_months forKey:kPayMVipInfoMonths];
}

- (id)copyWithZone:(NSZone *)zone
{
    PayMVipInfo *copy = [[PayMVipInfo alloc] init];
    
    if (copy) {

        copy.years = [self.years copyWithZone:zone];
        copy.months = [self.months copyWithZone:zone];
    }
    
    return copy;
}


@end

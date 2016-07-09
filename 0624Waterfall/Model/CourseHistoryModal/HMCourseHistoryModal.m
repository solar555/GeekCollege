//
//  HMCourseHistoryModal.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HMCourseHistoryModal.h"
#import "HMData.h"


NSString *const kHMCourseHistoryModalMsg = @"msg";
NSString *const kHMCourseHistoryModalData = @"data";
NSString *const kHMCourseHistoryModalCode = @"code";


@interface HMCourseHistoryModal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HMCourseHistoryModal

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
            self.msg = [self objectOrNilForKey:kHMCourseHistoryModalMsg fromDictionary:dict];
            self.data = [HMData modelObjectWithDictionary:[dict objectForKey:kHMCourseHistoryModalData]];
            self.code = [[self objectOrNilForKey:kHMCourseHistoryModalCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kHMCourseHistoryModalMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kHMCourseHistoryModalData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kHMCourseHistoryModalCode];

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

    self.msg = [aDecoder decodeObjectForKey:kHMCourseHistoryModalMsg];
    self.data = [aDecoder decodeObjectForKey:kHMCourseHistoryModalData];
    self.code = [aDecoder decodeDoubleForKey:kHMCourseHistoryModalCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kHMCourseHistoryModalMsg];
    [aCoder encodeObject:_data forKey:kHMCourseHistoryModalData];
    [aCoder encodeDouble:_code forKey:kHMCourseHistoryModalCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    HMCourseHistoryModal *copy = [[HMCourseHistoryModal alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

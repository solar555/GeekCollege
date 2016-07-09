//
//  SMCourseSeriesModal.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SMCourseSeriesModal.h"
#import "SMData.h"


NSString *const kSMCourseSeriesModalMsg = @"msg";
NSString *const kSMCourseSeriesModalData = @"data";
NSString *const kSMCourseSeriesModalCode = @"code";


@interface SMCourseSeriesModal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SMCourseSeriesModal

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
            self.msg = [self objectOrNilForKey:kSMCourseSeriesModalMsg fromDictionary:dict];
            self.data = [SMData modelObjectWithDictionary:[dict objectForKey:kSMCourseSeriesModalData]];
            self.code = [[self objectOrNilForKey:kSMCourseSeriesModalCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kSMCourseSeriesModalMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kSMCourseSeriesModalData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kSMCourseSeriesModalCode];

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

    self.msg = [aDecoder decodeObjectForKey:kSMCourseSeriesModalMsg];
    self.data = [aDecoder decodeObjectForKey:kSMCourseSeriesModalData];
    self.code = [aDecoder decodeDoubleForKey:kSMCourseSeriesModalCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kSMCourseSeriesModalMsg];
    [aCoder encodeObject:_data forKey:kSMCourseSeriesModalData];
    [aCoder encodeDouble:_code forKey:kSMCourseSeriesModalCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    SMCourseSeriesModal *copy = [[SMCourseSeriesModal alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

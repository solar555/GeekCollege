//
//  TMCourseTopModal.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "TMCourseTopModal.h"
#import "TMData.h"


NSString *const kTMCourseTopModalMsg = @"msg";
NSString *const kTMCourseTopModalData = @"data";
NSString *const kTMCourseTopModalCode = @"code";


@interface TMCourseTopModal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TMCourseTopModal

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
            self.msg = [self objectOrNilForKey:kTMCourseTopModalMsg fromDictionary:dict];
            self.data = [TMData modelObjectWithDictionary:[dict objectForKey:kTMCourseTopModalData]];
            self.code = [[self objectOrNilForKey:kTMCourseTopModalCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kTMCourseTopModalMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kTMCourseTopModalData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kTMCourseTopModalCode];

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

    self.msg = [aDecoder decodeObjectForKey:kTMCourseTopModalMsg];
    self.data = [aDecoder decodeObjectForKey:kTMCourseTopModalData];
    self.code = [aDecoder decodeDoubleForKey:kTMCourseTopModalCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kTMCourseTopModalMsg];
    [aCoder encodeObject:_data forKey:kTMCourseTopModalData];
    [aCoder encodeDouble:_code forKey:kTMCourseTopModalCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    TMCourseTopModal *copy = [[TMCourseTopModal alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

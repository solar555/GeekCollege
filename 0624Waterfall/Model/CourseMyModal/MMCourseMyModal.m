//
//  MMCourseMyModal.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MMCourseMyModal.h"
#import "MMData.h"


NSString *const kMMCourseMyModalMsg = @"msg";
NSString *const kMMCourseMyModalData = @"data";
NSString *const kMMCourseMyModalCode = @"code";


@interface MMCourseMyModal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MMCourseMyModal

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
            self.msg = [self objectOrNilForKey:kMMCourseMyModalMsg fromDictionary:dict];
            self.data = [MMData modelObjectWithDictionary:[dict objectForKey:kMMCourseMyModalData]];
            self.code = [[self objectOrNilForKey:kMMCourseMyModalCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kMMCourseMyModalMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kMMCourseMyModalData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kMMCourseMyModalCode];

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

    self.msg = [aDecoder decodeObjectForKey:kMMCourseMyModalMsg];
    self.data = [aDecoder decodeObjectForKey:kMMCourseMyModalData];
    self.code = [aDecoder decodeDoubleForKey:kMMCourseMyModalCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kMMCourseMyModalMsg];
    [aCoder encodeObject:_data forKey:kMMCourseMyModalData];
    [aCoder encodeDouble:_code forKey:kMMCourseMyModalCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    MMCourseMyModal *copy = [[MMCourseMyModal alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

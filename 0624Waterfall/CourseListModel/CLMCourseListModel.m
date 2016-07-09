//
//  CLMCourseListModel.m
//
//  Created by mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLMCourseListModel.h"
#import "CLMData.h"


NSString *const kCLMCourseListModelMsg = @"msg";
NSString *const kCLMCourseListModelData = @"data";
NSString *const kCLMCourseListModelCode = @"code";


@interface CLMCourseListModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLMCourseListModel

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
            self.msg = [self objectOrNilForKey:kCLMCourseListModelMsg fromDictionary:dict];
            self.data = [CLMData modelObjectWithDictionary:[dict objectForKey:kCLMCourseListModelData]];
            self.code = [[self objectOrNilForKey:kCLMCourseListModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kCLMCourseListModelMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kCLMCourseListModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kCLMCourseListModelCode];

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

    self.msg = [aDecoder decodeObjectForKey:kCLMCourseListModelMsg];
    self.data = [aDecoder decodeObjectForKey:kCLMCourseListModelData];
    self.code = [aDecoder decodeDoubleForKey:kCLMCourseListModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kCLMCourseListModelMsg];
    [aCoder encodeObject:_data forKey:kCLMCourseListModelData];
    [aCoder encodeDouble:_code forKey:kCLMCourseListModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLMCourseListModel *copy = [[CLMCourseListModel alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

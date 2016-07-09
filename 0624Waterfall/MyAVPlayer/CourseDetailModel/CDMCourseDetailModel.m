//
//  CDMCourseDetailModel.m
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CDMCourseDetailModel.h"
#import "CDMData.h"


NSString *const kCDMCourseDetailModelMsg = @"msg";
NSString *const kCDMCourseDetailModelData = @"data";
NSString *const kCDMCourseDetailModelCode = @"code";


@interface CDMCourseDetailModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CDMCourseDetailModel

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
            self.msg = [self objectOrNilForKey:kCDMCourseDetailModelMsg fromDictionary:dict];
            self.data = [CDMData modelObjectWithDictionary:[dict objectForKey:kCDMCourseDetailModelData]];
            self.code = [[self objectOrNilForKey:kCDMCourseDetailModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kCDMCourseDetailModelMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kCDMCourseDetailModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kCDMCourseDetailModelCode];

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

    self.msg = [aDecoder decodeObjectForKey:kCDMCourseDetailModelMsg];
    self.data = [aDecoder decodeObjectForKey:kCDMCourseDetailModelData];
    self.code = [aDecoder decodeDoubleForKey:kCDMCourseDetailModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kCDMCourseDetailModelMsg];
    [aCoder encodeObject:_data forKey:kCDMCourseDetailModelData];
    [aCoder encodeDouble:_code forKey:kCDMCourseDetailModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    CDMCourseDetailModel *copy = [[CDMCourseDetailModel alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

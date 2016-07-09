//
//  CLMMCourseLibraryMenuModel.m
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLMMCourseLibraryMenuModel.h"
#import "CLMMData.h"


NSString *const kCLMMCourseLibraryMenuModelMsg = @"msg";
NSString *const kCLMMCourseLibraryMenuModelData = @"data";
NSString *const kCLMMCourseLibraryMenuModelCode = @"code";


@interface CLMMCourseLibraryMenuModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLMMCourseLibraryMenuModel

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
            self.msg = [self objectOrNilForKey:kCLMMCourseLibraryMenuModelMsg fromDictionary:dict];
            self.data = [CLMMData modelObjectWithDictionary:[dict objectForKey:kCLMMCourseLibraryMenuModelData]];
            self.code = [[self objectOrNilForKey:kCLMMCourseLibraryMenuModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kCLMMCourseLibraryMenuModelMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kCLMMCourseLibraryMenuModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kCLMMCourseLibraryMenuModelCode];

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

    self.msg = [aDecoder decodeObjectForKey:kCLMMCourseLibraryMenuModelMsg];
    self.data = [aDecoder decodeObjectForKey:kCLMMCourseLibraryMenuModelData];
    self.code = [aDecoder decodeDoubleForKey:kCLMMCourseLibraryMenuModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kCLMMCourseLibraryMenuModelMsg];
    [aCoder encodeObject:_data forKey:kCLMMCourseLibraryMenuModelData];
    [aCoder encodeDouble:_code forKey:kCLMMCourseLibraryMenuModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLMMCourseLibraryMenuModel *copy = [[CLMMCourseLibraryMenuModel alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

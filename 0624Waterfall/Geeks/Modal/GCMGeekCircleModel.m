//
//  GCMGeekCircleModel.m
//
//  Created by mac  on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GCMGeekCircleModel.h"
#import "GCMData.h"


NSString *const kGCMGeekCircleModelMsg = @"msg";
NSString *const kGCMGeekCircleModelData = @"data";
NSString *const kGCMGeekCircleModelCode = @"code";


@interface GCMGeekCircleModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GCMGeekCircleModel

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
            self.msg = [self objectOrNilForKey:kGCMGeekCircleModelMsg fromDictionary:dict];
            self.data = [GCMData modelObjectWithDictionary:[dict objectForKey:kGCMGeekCircleModelData]];
            self.code = [[self objectOrNilForKey:kGCMGeekCircleModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kGCMGeekCircleModelMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kGCMGeekCircleModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kGCMGeekCircleModelCode];

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

    self.msg = [aDecoder decodeObjectForKey:kGCMGeekCircleModelMsg];
    self.data = [aDecoder decodeObjectForKey:kGCMGeekCircleModelData];
    self.code = [aDecoder decodeDoubleForKey:kGCMGeekCircleModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kGCMGeekCircleModelMsg];
    [aCoder encodeObject:_data forKey:kGCMGeekCircleModelData];
    [aCoder encodeDouble:_code forKey:kGCMGeekCircleModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    GCMGeekCircleModel *copy = [[GCMGeekCircleModel alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

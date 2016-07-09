//
//  MPMyProfileModel.m
//
//  Created by mac  on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MPMyProfileModel.h"
#import "MPData.h"


NSString *const kMPMyProfileModelMsg = @"msg";
NSString *const kMPMyProfileModelData = @"data";
NSString *const kMPMyProfileModelCode = @"code";


@interface MPMyProfileModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MPMyProfileModel

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
            self.msg = [self objectOrNilForKey:kMPMyProfileModelMsg fromDictionary:dict];
            self.data = [MPData modelObjectWithDictionary:[dict objectForKey:kMPMyProfileModelData]];
            self.code = [[self objectOrNilForKey:kMPMyProfileModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kMPMyProfileModelMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kMPMyProfileModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kMPMyProfileModelCode];

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

    self.msg = [aDecoder decodeObjectForKey:kMPMyProfileModelMsg];
    self.data = [aDecoder decodeObjectForKey:kMPMyProfileModelData];
    self.code = [aDecoder decodeDoubleForKey:kMPMyProfileModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kMPMyProfileModelMsg];
    [aCoder encodeObject:_data forKey:kMPMyProfileModelData];
    [aCoder encodeDouble:_code forKey:kMPMyProfileModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    MPMyProfileModel *copy = [[MPMyProfileModel alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

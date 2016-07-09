//
//  BMCourseBannerModal.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BMCourseBannerModal.h"
#import "BMData.h"


NSString *const kBMCourseBannerModalMsg = @"msg";
NSString *const kBMCourseBannerModalData = @"data";
NSString *const kBMCourseBannerModalCode = @"code";


@interface BMCourseBannerModal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BMCourseBannerModal

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
            self.msg = [self objectOrNilForKey:kBMCourseBannerModalMsg fromDictionary:dict];
            self.data = [BMData modelObjectWithDictionary:[dict objectForKey:kBMCourseBannerModalData]];
            self.code = [[self objectOrNilForKey:kBMCourseBannerModalCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kBMCourseBannerModalMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kBMCourseBannerModalData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kBMCourseBannerModalCode];

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

    self.msg = [aDecoder decodeObjectForKey:kBMCourseBannerModalMsg];
    self.data = [aDecoder decodeObjectForKey:kBMCourseBannerModalData];
    self.code = [aDecoder decodeDoubleForKey:kBMCourseBannerModalCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kBMCourseBannerModalMsg];
    [aCoder encodeObject:_data forKey:kBMCourseBannerModalData];
    [aCoder encodeDouble:_code forKey:kBMCourseBannerModalCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    BMCourseBannerModal *copy = [[BMCourseBannerModal alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

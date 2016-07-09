//
//  PMCourseProfessionModal.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PMCourseProfessionModal.h"
#import "PMData.h"


NSString *const kPMCourseProfessionModalMsg = @"msg";
NSString *const kPMCourseProfessionModalData = @"data";
NSString *const kPMCourseProfessionModalCode = @"code";


@interface PMCourseProfessionModal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PMCourseProfessionModal

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
            self.msg = [self objectOrNilForKey:kPMCourseProfessionModalMsg fromDictionary:dict];
            self.data = [PMData modelObjectWithDictionary:[dict objectForKey:kPMCourseProfessionModalData]];
            self.code = [[self objectOrNilForKey:kPMCourseProfessionModalCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kPMCourseProfessionModalMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kPMCourseProfessionModalData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kPMCourseProfessionModalCode];

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

    self.msg = [aDecoder decodeObjectForKey:kPMCourseProfessionModalMsg];
    self.data = [aDecoder decodeObjectForKey:kPMCourseProfessionModalData];
    self.code = [aDecoder decodeDoubleForKey:kPMCourseProfessionModalCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kPMCourseProfessionModalMsg];
    [aCoder encodeObject:_data forKey:kPMCourseProfessionModalData];
    [aCoder encodeDouble:_code forKey:kPMCourseProfessionModalCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    PMCourseProfessionModal *copy = [[PMCourseProfessionModal alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

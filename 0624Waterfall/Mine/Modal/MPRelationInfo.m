//
//  MPRelationInfo.m
//
//  Created by mac  on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MPRelationInfo.h"


NSString *const kMPRelationInfoObjUid = @"obj_uid";
NSString *const kMPRelationInfoIsFans = @"is_fans";
NSString *const kMPRelationInfoIsFollow = @"is_follow";


@interface MPRelationInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MPRelationInfo

@synthesize objUid = _objUid;
@synthesize isFans = _isFans;
@synthesize isFollow = _isFollow;


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
            self.objUid = [self objectOrNilForKey:kMPRelationInfoObjUid fromDictionary:dict];
            self.isFans = [[self objectOrNilForKey:kMPRelationInfoIsFans fromDictionary:dict] boolValue];
            self.isFollow = [[self objectOrNilForKey:kMPRelationInfoIsFollow fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.objUid forKey:kMPRelationInfoObjUid];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFans] forKey:kMPRelationInfoIsFans];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFollow] forKey:kMPRelationInfoIsFollow];

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

    self.objUid = [aDecoder decodeObjectForKey:kMPRelationInfoObjUid];
    self.isFans = [aDecoder decodeBoolForKey:kMPRelationInfoIsFans];
    self.isFollow = [aDecoder decodeBoolForKey:kMPRelationInfoIsFollow];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_objUid forKey:kMPRelationInfoObjUid];
    [aCoder encodeBool:_isFans forKey:kMPRelationInfoIsFans];
    [aCoder encodeBool:_isFollow forKey:kMPRelationInfoIsFollow];
}

- (id)copyWithZone:(NSZone *)zone
{
    MPRelationInfo *copy = [[MPRelationInfo alloc] init];
    
    if (copy) {

        copy.objUid = [self.objUid copyWithZone:zone];
        copy.isFans = self.isFans;
        copy.isFollow = self.isFollow;
    }
    
    return copy;
}


@end

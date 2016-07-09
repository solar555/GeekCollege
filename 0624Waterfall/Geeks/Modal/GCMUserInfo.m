//
//  GCMUserInfo.m
//
//  Created by mac  on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GCMUserInfo.h"


NSString *const kGCMUserInfoUid = @"uid";
NSString *const kGCMUserInfoUname = @"uname";
NSString *const kGCMUserInfoPosition = @"position";
NSString *const kGCMUserInfoAvatar = @"avatar";


@interface GCMUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GCMUserInfo

@synthesize uid = _uid;
@synthesize uname = _uname;
@synthesize position = _position;
@synthesize avatar = _avatar;


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
            self.uid = [self objectOrNilForKey:kGCMUserInfoUid fromDictionary:dict];
            self.uname = [self objectOrNilForKey:kGCMUserInfoUname fromDictionary:dict];
            self.position = [self objectOrNilForKey:kGCMUserInfoPosition fromDictionary:dict];
            self.avatar = [self objectOrNilForKey:kGCMUserInfoAvatar fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.uid forKey:kGCMUserInfoUid];
    [mutableDict setValue:self.uname forKey:kGCMUserInfoUname];
    [mutableDict setValue:self.position forKey:kGCMUserInfoPosition];
    [mutableDict setValue:self.avatar forKey:kGCMUserInfoAvatar];

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

    self.uid = [aDecoder decodeObjectForKey:kGCMUserInfoUid];
    self.uname = [aDecoder decodeObjectForKey:kGCMUserInfoUname];
    self.position = [aDecoder decodeObjectForKey:kGCMUserInfoPosition];
    self.avatar = [aDecoder decodeObjectForKey:kGCMUserInfoAvatar];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_uid forKey:kGCMUserInfoUid];
    [aCoder encodeObject:_uname forKey:kGCMUserInfoUname];
    [aCoder encodeObject:_position forKey:kGCMUserInfoPosition];
    [aCoder encodeObject:_avatar forKey:kGCMUserInfoAvatar];
}

- (id)copyWithZone:(NSZone *)zone
{
    GCMUserInfo *copy = [[GCMUserInfo alloc] init];
    
    if (copy) {

        copy.uid = [self.uid copyWithZone:zone];
        copy.uname = [self.uname copyWithZone:zone];
        copy.position = [self.position copyWithZone:zone];
        copy.avatar = [self.avatar copyWithZone:zone];
    }
    
    return copy;
}


@end

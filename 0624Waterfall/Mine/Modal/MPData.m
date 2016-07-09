//
//  MPData.m
//
//  Created by mac  on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MPData.h"
#import "MPRelationInfo.h"


NSString *const kMPDataDescription = @"description";
NSString *const kMPDataTruename = @"truename";
NSString *const kMPDataPhone = @"phone";
NSString *const kMPDataUid = @"uid";
NSString *const kMPDataPosition = @"position";
NSString *const kMPDataCreatedAt = @"created_at";
NSString *const kMPDataRelationInfo = @"relation_info";
NSString *const kMPDataSex = @"sex";
NSString *const kMPDataCompany = @"company";
NSString *const kMPDataUname = @"uname";
NSString *const kMPDataAvatar = @"avatar";
NSString *const kMPDataPhoneStatus = @"phone_status";
NSString *const kMPDataLifeCity = @"life_city";
NSString *const kMPDataEmailStatus = @"email_status";
NSString *const kMPDataEmail = @"email";


@interface MPData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MPData

@synthesize dataDescription = _dataDescription;
@synthesize truename = _truename;
@synthesize phone = _phone;
@synthesize uid = _uid;
@synthesize position = _position;
@synthesize createdAt = _createdAt;
@synthesize relationInfo = _relationInfo;
@synthesize sex = _sex;
@synthesize company = _company;
@synthesize uname = _uname;
@synthesize avatar = _avatar;
@synthesize phoneStatus = _phoneStatus;
@synthesize lifeCity = _lifeCity;
@synthesize emailStatus = _emailStatus;
@synthesize email = _email;


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
            self.dataDescription = [self objectOrNilForKey:kMPDataDescription fromDictionary:dict];
            self.truename = [self objectOrNilForKey:kMPDataTruename fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kMPDataPhone fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kMPDataUid fromDictionary:dict] doubleValue];
            self.position = [self objectOrNilForKey:kMPDataPosition fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kMPDataCreatedAt fromDictionary:dict];
            self.relationInfo = [MPRelationInfo modelObjectWithDictionary:[dict objectForKey:kMPDataRelationInfo]];
            self.sex = [self objectOrNilForKey:kMPDataSex fromDictionary:dict];
            self.company = [self objectOrNilForKey:kMPDataCompany fromDictionary:dict];
            self.uname = [self objectOrNilForKey:kMPDataUname fromDictionary:dict];
            self.avatar = [self objectOrNilForKey:kMPDataAvatar fromDictionary:dict];
            self.phoneStatus = [self objectOrNilForKey:kMPDataPhoneStatus fromDictionary:dict];
            self.lifeCity = [self objectOrNilForKey:kMPDataLifeCity fromDictionary:dict];
            self.emailStatus = [self objectOrNilForKey:kMPDataEmailStatus fromDictionary:dict];
            self.email = [self objectOrNilForKey:kMPDataEmail fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataDescription forKey:kMPDataDescription];
    [mutableDict setValue:self.truename forKey:kMPDataTruename];
    [mutableDict setValue:self.phone forKey:kMPDataPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kMPDataUid];
    [mutableDict setValue:self.position forKey:kMPDataPosition];
    [mutableDict setValue:self.createdAt forKey:kMPDataCreatedAt];
    [mutableDict setValue:[self.relationInfo dictionaryRepresentation] forKey:kMPDataRelationInfo];
    [mutableDict setValue:self.sex forKey:kMPDataSex];
    [mutableDict setValue:self.company forKey:kMPDataCompany];
    [mutableDict setValue:self.uname forKey:kMPDataUname];
    [mutableDict setValue:self.avatar forKey:kMPDataAvatar];
    [mutableDict setValue:self.phoneStatus forKey:kMPDataPhoneStatus];
    [mutableDict setValue:self.lifeCity forKey:kMPDataLifeCity];
    [mutableDict setValue:self.emailStatus forKey:kMPDataEmailStatus];
    [mutableDict setValue:self.email forKey:kMPDataEmail];

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

    self.dataDescription = [aDecoder decodeObjectForKey:kMPDataDescription];
    self.truename = [aDecoder decodeObjectForKey:kMPDataTruename];
    self.phone = [aDecoder decodeObjectForKey:kMPDataPhone];
    self.uid = [aDecoder decodeDoubleForKey:kMPDataUid];
    self.position = [aDecoder decodeObjectForKey:kMPDataPosition];
    self.createdAt = [aDecoder decodeObjectForKey:kMPDataCreatedAt];
    self.relationInfo = [aDecoder decodeObjectForKey:kMPDataRelationInfo];
    self.sex = [aDecoder decodeObjectForKey:kMPDataSex];
    self.company = [aDecoder decodeObjectForKey:kMPDataCompany];
    self.uname = [aDecoder decodeObjectForKey:kMPDataUname];
    self.avatar = [aDecoder decodeObjectForKey:kMPDataAvatar];
    self.phoneStatus = [aDecoder decodeObjectForKey:kMPDataPhoneStatus];
    self.lifeCity = [aDecoder decodeObjectForKey:kMPDataLifeCity];
    self.emailStatus = [aDecoder decodeObjectForKey:kMPDataEmailStatus];
    self.email = [aDecoder decodeObjectForKey:kMPDataEmail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataDescription forKey:kMPDataDescription];
    [aCoder encodeObject:_truename forKey:kMPDataTruename];
    [aCoder encodeObject:_phone forKey:kMPDataPhone];
    [aCoder encodeDouble:_uid forKey:kMPDataUid];
    [aCoder encodeObject:_position forKey:kMPDataPosition];
    [aCoder encodeObject:_createdAt forKey:kMPDataCreatedAt];
    [aCoder encodeObject:_relationInfo forKey:kMPDataRelationInfo];
    [aCoder encodeObject:_sex forKey:kMPDataSex];
    [aCoder encodeObject:_company forKey:kMPDataCompany];
    [aCoder encodeObject:_uname forKey:kMPDataUname];
    [aCoder encodeObject:_avatar forKey:kMPDataAvatar];
    [aCoder encodeObject:_phoneStatus forKey:kMPDataPhoneStatus];
    [aCoder encodeObject:_lifeCity forKey:kMPDataLifeCity];
    [aCoder encodeObject:_emailStatus forKey:kMPDataEmailStatus];
    [aCoder encodeObject:_email forKey:kMPDataEmail];
}

- (id)copyWithZone:(NSZone *)zone
{
    MPData *copy = [[MPData alloc] init];
    
    if (copy) {

        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.truename = [self.truename copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.uid = self.uid;
        copy.position = [self.position copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.relationInfo = [self.relationInfo copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.company = [self.company copyWithZone:zone];
        copy.uname = [self.uname copyWithZone:zone];
        copy.avatar = [self.avatar copyWithZone:zone];
        copy.phoneStatus = [self.phoneStatus copyWithZone:zone];
        copy.lifeCity = [self.lifeCity copyWithZone:zone];
        copy.emailStatus = [self.emailStatus copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  GCMList.m
//
//  Created by mac  on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GCMList.h"
#import "GCMDetail.h"
#import "GCMUserInfo.h"


NSString *const kGCMListDetail = @"detail";
NSString *const kGCMListUserInfo = @"user_info";
NSString *const kGCMListUid = @"uid";
NSString *const kGCMListInfoId = @"info_id";
NSString *const kGCMListCreatedAt = @"created_at";
NSString *const kGCMListDesc = @"desc";
NSString *const kGCMListFeedId = @"feed_id";
NSString *const kGCMListObjectType = @"object_type";
NSString *const kGCMListCommentNum = @"comment_num";
NSString *const kGCMListLikeNum = @"like_num";
NSString *const kGCMListObjectId = @"object_id";
NSString *const kGCMListIsLike = @"is_like";


@interface GCMList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GCMList

@synthesize detail = _detail;
@synthesize userInfo = _userInfo;
@synthesize uid = _uid;
@synthesize infoId = _infoId;
@synthesize createdAt = _createdAt;
@synthesize desc = _desc;
@synthesize feedId = _feedId;
@synthesize objectType = _objectType;
@synthesize commentNum = _commentNum;
@synthesize likeNum = _likeNum;
@synthesize objectId = _objectId;
@synthesize isLike = _isLike;


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
            self.detail = [GCMDetail modelObjectWithDictionary:[dict objectForKey:kGCMListDetail]];
            self.userInfo = [GCMUserInfo modelObjectWithDictionary:[dict objectForKey:kGCMListUserInfo]];
            self.uid = [self objectOrNilForKey:kGCMListUid fromDictionary:dict];
            self.infoId = [self objectOrNilForKey:kGCMListInfoId fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kGCMListCreatedAt fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kGCMListDesc fromDictionary:dict];
            self.feedId = [self objectOrNilForKey:kGCMListFeedId fromDictionary:dict];
            self.objectType = [self objectOrNilForKey:kGCMListObjectType fromDictionary:dict];
            self.commentNum = [[self objectOrNilForKey:kGCMListCommentNum fromDictionary:dict] doubleValue];
            self.likeNum = [[self objectOrNilForKey:kGCMListLikeNum fromDictionary:dict] doubleValue];
            self.objectId = [self objectOrNilForKey:kGCMListObjectId fromDictionary:dict];
            self.isLike = [[self objectOrNilForKey:kGCMListIsLike fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.detail dictionaryRepresentation] forKey:kGCMListDetail];
    [mutableDict setValue:[self.userInfo dictionaryRepresentation] forKey:kGCMListUserInfo];
    [mutableDict setValue:self.uid forKey:kGCMListUid];
    [mutableDict setValue:self.infoId forKey:kGCMListInfoId];
    [mutableDict setValue:self.createdAt forKey:kGCMListCreatedAt];
    [mutableDict setValue:self.desc forKey:kGCMListDesc];
    [mutableDict setValue:self.feedId forKey:kGCMListFeedId];
    [mutableDict setValue:self.objectType forKey:kGCMListObjectType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentNum] forKey:kGCMListCommentNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeNum] forKey:kGCMListLikeNum];
    [mutableDict setValue:self.objectId forKey:kGCMListObjectId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLike] forKey:kGCMListIsLike];

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

    self.detail = [aDecoder decodeObjectForKey:kGCMListDetail];
    self.userInfo = [aDecoder decodeObjectForKey:kGCMListUserInfo];
    self.uid = [aDecoder decodeObjectForKey:kGCMListUid];
    self.infoId = [aDecoder decodeObjectForKey:kGCMListInfoId];
    self.createdAt = [aDecoder decodeObjectForKey:kGCMListCreatedAt];
    self.desc = [aDecoder decodeObjectForKey:kGCMListDesc];
    self.feedId = [aDecoder decodeObjectForKey:kGCMListFeedId];
    self.objectType = [aDecoder decodeObjectForKey:kGCMListObjectType];
    self.commentNum = [aDecoder decodeDoubleForKey:kGCMListCommentNum];
    self.likeNum = [aDecoder decodeDoubleForKey:kGCMListLikeNum];
    self.objectId = [aDecoder decodeObjectForKey:kGCMListObjectId];
    self.isLike = [aDecoder decodeBoolForKey:kGCMListIsLike];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_detail forKey:kGCMListDetail];
    [aCoder encodeObject:_userInfo forKey:kGCMListUserInfo];
    [aCoder encodeObject:_uid forKey:kGCMListUid];
    [aCoder encodeObject:_infoId forKey:kGCMListInfoId];
    [aCoder encodeObject:_createdAt forKey:kGCMListCreatedAt];
    [aCoder encodeObject:_desc forKey:kGCMListDesc];
    [aCoder encodeObject:_feedId forKey:kGCMListFeedId];
    [aCoder encodeObject:_objectType forKey:kGCMListObjectType];
    [aCoder encodeDouble:_commentNum forKey:kGCMListCommentNum];
    [aCoder encodeDouble:_likeNum forKey:kGCMListLikeNum];
    [aCoder encodeObject:_objectId forKey:kGCMListObjectId];
    [aCoder encodeBool:_isLike forKey:kGCMListIsLike];
}

- (id)copyWithZone:(NSZone *)zone
{
    GCMList *copy = [[GCMList alloc] init];
    
    if (copy) {

        copy.detail = [self.detail copyWithZone:zone];
        copy.userInfo = [self.userInfo copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.infoId = [self.infoId copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.feedId = [self.feedId copyWithZone:zone];
        copy.objectType = [self.objectType copyWithZone:zone];
        copy.commentNum = self.commentNum;
        copy.likeNum = self.likeNum;
        copy.objectId = [self.objectId copyWithZone:zone];
        copy.isLike = self.isLike;
    }
    
    return copy;
}


@end

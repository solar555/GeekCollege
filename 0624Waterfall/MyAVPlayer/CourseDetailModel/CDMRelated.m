//
//  CDMRelated.m
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CDMRelated.h"


NSString *const kCDMRelatedStudyNum = @"study_num";
NSString *const kCDMRelatedLessonCount = @"lesson_count";
NSString *const kCDMRelatedCreatedAt = @"created_at";
NSString *const kCDMRelatedFinishLessionCount = @"finish_lession_count";
NSString *const kCDMRelatedTime = @"time";
NSString *const kCDMRelatedFavAt = @"fav_at";
NSString *const kCDMRelatedImg = @"img";
NSString *const kCDMRelatedTitle = @"title";
NSString *const kCDMRelatedLevel = @"level";
NSString *const kCDMRelatedIsFree = @"is_free";
NSString *const kCDMRelatedCid = @"cid";
NSString *const kCDMRelatedVisitAt = @"visit_at";
NSString *const kCDMRelatedIsFav = @"is_fav";
NSString *const kCDMRelatedLastSeq = @"last_seq";


@interface CDMRelated ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CDMRelated

@synthesize studyNum = _studyNum;
@synthesize lessonCount = _lessonCount;
@synthesize createdAt = _createdAt;
@synthesize finishLessionCount = _finishLessionCount;
@synthesize time = _time;
@synthesize favAt = _favAt;
@synthesize img = _img;
@synthesize title = _title;
@synthesize level = _level;
@synthesize isFree = _isFree;
@synthesize cid = _cid;
@synthesize visitAt = _visitAt;
@synthesize isFav = _isFav;
@synthesize lastSeq = _lastSeq;


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
            self.studyNum = [[self objectOrNilForKey:kCDMRelatedStudyNum fromDictionary:dict] doubleValue];
            self.lessonCount = [[self objectOrNilForKey:kCDMRelatedLessonCount fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kCDMRelatedCreatedAt fromDictionary:dict];
            self.finishLessionCount = [[self objectOrNilForKey:kCDMRelatedFinishLessionCount fromDictionary:dict] doubleValue];
            self.time = [[self objectOrNilForKey:kCDMRelatedTime fromDictionary:dict] doubleValue];
            self.favAt = [self objectOrNilForKey:kCDMRelatedFavAt fromDictionary:dict];
            self.img = [self objectOrNilForKey:kCDMRelatedImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCDMRelatedTitle fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kCDMRelatedLevel fromDictionary:dict] doubleValue];
            self.isFree = [[self objectOrNilForKey:kCDMRelatedIsFree fromDictionary:dict] doubleValue];
            self.cid = [[self objectOrNilForKey:kCDMRelatedCid fromDictionary:dict] doubleValue];
            self.visitAt = [self objectOrNilForKey:kCDMRelatedVisitAt fromDictionary:dict];
            self.isFav = [[self objectOrNilForKey:kCDMRelatedIsFav fromDictionary:dict] doubleValue];
            self.lastSeq = [[self objectOrNilForKey:kCDMRelatedLastSeq fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.studyNum] forKey:kCDMRelatedStudyNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lessonCount] forKey:kCDMRelatedLessonCount];
    [mutableDict setValue:self.createdAt forKey:kCDMRelatedCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.finishLessionCount] forKey:kCDMRelatedFinishLessionCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kCDMRelatedTime];
    [mutableDict setValue:self.favAt forKey:kCDMRelatedFavAt];
    [mutableDict setValue:self.img forKey:kCDMRelatedImg];
    [mutableDict setValue:self.title forKey:kCDMRelatedTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kCDMRelatedLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFree] forKey:kCDMRelatedIsFree];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cid] forKey:kCDMRelatedCid];
    [mutableDict setValue:self.visitAt forKey:kCDMRelatedVisitAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFav] forKey:kCDMRelatedIsFav];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastSeq] forKey:kCDMRelatedLastSeq];

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

    self.studyNum = [aDecoder decodeDoubleForKey:kCDMRelatedStudyNum];
    self.lessonCount = [aDecoder decodeDoubleForKey:kCDMRelatedLessonCount];
    self.createdAt = [aDecoder decodeObjectForKey:kCDMRelatedCreatedAt];
    self.finishLessionCount = [aDecoder decodeDoubleForKey:kCDMRelatedFinishLessionCount];
    self.time = [aDecoder decodeDoubleForKey:kCDMRelatedTime];
    self.favAt = [aDecoder decodeObjectForKey:kCDMRelatedFavAt];
    self.img = [aDecoder decodeObjectForKey:kCDMRelatedImg];
    self.title = [aDecoder decodeObjectForKey:kCDMRelatedTitle];
    self.level = [aDecoder decodeDoubleForKey:kCDMRelatedLevel];
    self.isFree = [aDecoder decodeDoubleForKey:kCDMRelatedIsFree];
    self.cid = [aDecoder decodeDoubleForKey:kCDMRelatedCid];
    self.visitAt = [aDecoder decodeObjectForKey:kCDMRelatedVisitAt];
    self.isFav = [aDecoder decodeDoubleForKey:kCDMRelatedIsFav];
    self.lastSeq = [aDecoder decodeDoubleForKey:kCDMRelatedLastSeq];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_studyNum forKey:kCDMRelatedStudyNum];
    [aCoder encodeDouble:_lessonCount forKey:kCDMRelatedLessonCount];
    [aCoder encodeObject:_createdAt forKey:kCDMRelatedCreatedAt];
    [aCoder encodeDouble:_finishLessionCount forKey:kCDMRelatedFinishLessionCount];
    [aCoder encodeDouble:_time forKey:kCDMRelatedTime];
    [aCoder encodeObject:_favAt forKey:kCDMRelatedFavAt];
    [aCoder encodeObject:_img forKey:kCDMRelatedImg];
    [aCoder encodeObject:_title forKey:kCDMRelatedTitle];
    [aCoder encodeDouble:_level forKey:kCDMRelatedLevel];
    [aCoder encodeDouble:_isFree forKey:kCDMRelatedIsFree];
    [aCoder encodeDouble:_cid forKey:kCDMRelatedCid];
    [aCoder encodeObject:_visitAt forKey:kCDMRelatedVisitAt];
    [aCoder encodeDouble:_isFav forKey:kCDMRelatedIsFav];
    [aCoder encodeDouble:_lastSeq forKey:kCDMRelatedLastSeq];
}

- (id)copyWithZone:(NSZone *)zone
{
    CDMRelated *copy = [[CDMRelated alloc] init];
    
    if (copy) {

        copy.studyNum = self.studyNum;
        copy.lessonCount = self.lessonCount;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.finishLessionCount = self.finishLessionCount;
        copy.time = self.time;
        copy.favAt = [self.favAt copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.level = self.level;
        copy.isFree = self.isFree;
        copy.cid = self.cid;
        copy.visitAt = [self.visitAt copyWithZone:zone];
        copy.isFav = self.isFav;
        copy.lastSeq = self.lastSeq;
    }
    
    return copy;
}


@end

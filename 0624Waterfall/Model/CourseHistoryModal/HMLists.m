//
//  HMLists.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HMLists.h"


NSString *const kHMListsStudyNum = @"study_num";
NSString *const kHMListsLessonCount = @"lesson_count";
NSString *const kHMListsCreatedAt = @"created_at";
NSString *const kHMListsFinishLessionCount = @"finish_lession_count";
NSString *const kHMListsTime = @"time";
NSString *const kHMListsFavAt = @"fav_at";
NSString *const kHMListsImg = @"img";
NSString *const kHMListsTitle = @"title";
NSString *const kHMListsLevel = @"level";
NSString *const kHMListsIsFree = @"is_free";
NSString *const kHMListsCid = @"cid";
NSString *const kHMListsVisitAt = @"visit_at";
NSString *const kHMListsIsFav = @"is_fav";
NSString *const kHMListsLastSeq = @"last_seq";


@interface HMLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HMLists

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
            self.studyNum = [[self objectOrNilForKey:kHMListsStudyNum fromDictionary:dict] doubleValue];
            self.lessonCount = [[self objectOrNilForKey:kHMListsLessonCount fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kHMListsCreatedAt fromDictionary:dict];
            self.finishLessionCount = [[self objectOrNilForKey:kHMListsFinishLessionCount fromDictionary:dict] doubleValue];
            self.time = [[self objectOrNilForKey:kHMListsTime fromDictionary:dict] doubleValue];
            self.favAt = [self objectOrNilForKey:kHMListsFavAt fromDictionary:dict];
            self.img = [self objectOrNilForKey:kHMListsImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHMListsTitle fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kHMListsLevel fromDictionary:dict] doubleValue];
            self.isFree = [[self objectOrNilForKey:kHMListsIsFree fromDictionary:dict] doubleValue];
            self.cid = [[self objectOrNilForKey:kHMListsCid fromDictionary:dict] doubleValue];
            self.visitAt = [self objectOrNilForKey:kHMListsVisitAt fromDictionary:dict];
            self.isFav = [[self objectOrNilForKey:kHMListsIsFav fromDictionary:dict] doubleValue];
            self.lastSeq = [[self objectOrNilForKey:kHMListsLastSeq fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.studyNum] forKey:kHMListsStudyNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lessonCount] forKey:kHMListsLessonCount];
    [mutableDict setValue:self.createdAt forKey:kHMListsCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.finishLessionCount] forKey:kHMListsFinishLessionCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kHMListsTime];
    [mutableDict setValue:self.favAt forKey:kHMListsFavAt];
    [mutableDict setValue:self.img forKey:kHMListsImg];
    [mutableDict setValue:self.title forKey:kHMListsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kHMListsLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFree] forKey:kHMListsIsFree];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cid] forKey:kHMListsCid];
    [mutableDict setValue:self.visitAt forKey:kHMListsVisitAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFav] forKey:kHMListsIsFav];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastSeq] forKey:kHMListsLastSeq];

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

    self.studyNum = [aDecoder decodeDoubleForKey:kHMListsStudyNum];
    self.lessonCount = [aDecoder decodeDoubleForKey:kHMListsLessonCount];
    self.createdAt = [aDecoder decodeObjectForKey:kHMListsCreatedAt];
    self.finishLessionCount = [aDecoder decodeDoubleForKey:kHMListsFinishLessionCount];
    self.time = [aDecoder decodeDoubleForKey:kHMListsTime];
    self.favAt = [aDecoder decodeObjectForKey:kHMListsFavAt];
    self.img = [aDecoder decodeObjectForKey:kHMListsImg];
    self.title = [aDecoder decodeObjectForKey:kHMListsTitle];
    self.level = [aDecoder decodeDoubleForKey:kHMListsLevel];
    self.isFree = [aDecoder decodeDoubleForKey:kHMListsIsFree];
    self.cid = [aDecoder decodeDoubleForKey:kHMListsCid];
    self.visitAt = [aDecoder decodeObjectForKey:kHMListsVisitAt];
    self.isFav = [aDecoder decodeDoubleForKey:kHMListsIsFav];
    self.lastSeq = [aDecoder decodeDoubleForKey:kHMListsLastSeq];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_studyNum forKey:kHMListsStudyNum];
    [aCoder encodeDouble:_lessonCount forKey:kHMListsLessonCount];
    [aCoder encodeObject:_createdAt forKey:kHMListsCreatedAt];
    [aCoder encodeDouble:_finishLessionCount forKey:kHMListsFinishLessionCount];
    [aCoder encodeDouble:_time forKey:kHMListsTime];
    [aCoder encodeObject:_favAt forKey:kHMListsFavAt];
    [aCoder encodeObject:_img forKey:kHMListsImg];
    [aCoder encodeObject:_title forKey:kHMListsTitle];
    [aCoder encodeDouble:_level forKey:kHMListsLevel];
    [aCoder encodeDouble:_isFree forKey:kHMListsIsFree];
    [aCoder encodeDouble:_cid forKey:kHMListsCid];
    [aCoder encodeObject:_visitAt forKey:kHMListsVisitAt];
    [aCoder encodeDouble:_isFav forKey:kHMListsIsFav];
    [aCoder encodeDouble:_lastSeq forKey:kHMListsLastSeq];
}

- (id)copyWithZone:(NSZone *)zone
{
    HMLists *copy = [[HMLists alloc] init];
    
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

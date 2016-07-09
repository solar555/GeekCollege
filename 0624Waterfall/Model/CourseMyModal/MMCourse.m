//
//  MMCourse.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MMCourse.h"


NSString *const kMMCourseStudyNum = @"study_num";
NSString *const kMMCourseLessonCount = @"lesson_count";
NSString *const kMMCourseCreatedAt = @"created_at";
NSString *const kMMCourseFinishLessionCount = @"finish_lession_count";
NSString *const kMMCourseTime = @"time";
NSString *const kMMCourseFavAt = @"fav_at";
NSString *const kMMCourseImg = @"img";
NSString *const kMMCourseTitle = @"title";
NSString *const kMMCourseLevel = @"level";
NSString *const kMMCourseIsFree = @"is_free";
NSString *const kMMCourseCid = @"cid";
NSString *const kMMCourseVisitAt = @"visit_at";
NSString *const kMMCourseIsFav = @"is_fav";
NSString *const kMMCourseLastSeq = @"last_seq";


@interface MMCourse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MMCourse

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
            self.studyNum = [[self objectOrNilForKey:kMMCourseStudyNum fromDictionary:dict] doubleValue];
            self.lessonCount = [[self objectOrNilForKey:kMMCourseLessonCount fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kMMCourseCreatedAt fromDictionary:dict];
            self.finishLessionCount = [[self objectOrNilForKey:kMMCourseFinishLessionCount fromDictionary:dict] doubleValue];
            self.time = [[self objectOrNilForKey:kMMCourseTime fromDictionary:dict] doubleValue];
            self.favAt = [self objectOrNilForKey:kMMCourseFavAt fromDictionary:dict];
            self.img = [self objectOrNilForKey:kMMCourseImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kMMCourseTitle fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kMMCourseLevel fromDictionary:dict] doubleValue];
            self.isFree = [[self objectOrNilForKey:kMMCourseIsFree fromDictionary:dict] doubleValue];
            self.cid = [[self objectOrNilForKey:kMMCourseCid fromDictionary:dict] doubleValue];
            self.visitAt = [self objectOrNilForKey:kMMCourseVisitAt fromDictionary:dict];
            self.isFav = [[self objectOrNilForKey:kMMCourseIsFav fromDictionary:dict] doubleValue];
            self.lastSeq = [[self objectOrNilForKey:kMMCourseLastSeq fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.studyNum] forKey:kMMCourseStudyNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lessonCount] forKey:kMMCourseLessonCount];
    [mutableDict setValue:self.createdAt forKey:kMMCourseCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.finishLessionCount] forKey:kMMCourseFinishLessionCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kMMCourseTime];
    [mutableDict setValue:self.favAt forKey:kMMCourseFavAt];
    [mutableDict setValue:self.img forKey:kMMCourseImg];
    [mutableDict setValue:self.title forKey:kMMCourseTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kMMCourseLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFree] forKey:kMMCourseIsFree];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cid] forKey:kMMCourseCid];
    [mutableDict setValue:self.visitAt forKey:kMMCourseVisitAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFav] forKey:kMMCourseIsFav];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastSeq] forKey:kMMCourseLastSeq];

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

    self.studyNum = [aDecoder decodeDoubleForKey:kMMCourseStudyNum];
    self.lessonCount = [aDecoder decodeDoubleForKey:kMMCourseLessonCount];
    self.createdAt = [aDecoder decodeObjectForKey:kMMCourseCreatedAt];
    self.finishLessionCount = [aDecoder decodeDoubleForKey:kMMCourseFinishLessionCount];
    self.time = [aDecoder decodeDoubleForKey:kMMCourseTime];
    self.favAt = [aDecoder decodeObjectForKey:kMMCourseFavAt];
    self.img = [aDecoder decodeObjectForKey:kMMCourseImg];
    self.title = [aDecoder decodeObjectForKey:kMMCourseTitle];
    self.level = [aDecoder decodeDoubleForKey:kMMCourseLevel];
    self.isFree = [aDecoder decodeDoubleForKey:kMMCourseIsFree];
    self.cid = [aDecoder decodeDoubleForKey:kMMCourseCid];
    self.visitAt = [aDecoder decodeObjectForKey:kMMCourseVisitAt];
    self.isFav = [aDecoder decodeDoubleForKey:kMMCourseIsFav];
    self.lastSeq = [aDecoder decodeDoubleForKey:kMMCourseLastSeq];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_studyNum forKey:kMMCourseStudyNum];
    [aCoder encodeDouble:_lessonCount forKey:kMMCourseLessonCount];
    [aCoder encodeObject:_createdAt forKey:kMMCourseCreatedAt];
    [aCoder encodeDouble:_finishLessionCount forKey:kMMCourseFinishLessionCount];
    [aCoder encodeDouble:_time forKey:kMMCourseTime];
    [aCoder encodeObject:_favAt forKey:kMMCourseFavAt];
    [aCoder encodeObject:_img forKey:kMMCourseImg];
    [aCoder encodeObject:_title forKey:kMMCourseTitle];
    [aCoder encodeDouble:_level forKey:kMMCourseLevel];
    [aCoder encodeDouble:_isFree forKey:kMMCourseIsFree];
    [aCoder encodeDouble:_cid forKey:kMMCourseCid];
    [aCoder encodeObject:_visitAt forKey:kMMCourseVisitAt];
    [aCoder encodeDouble:_isFav forKey:kMMCourseIsFav];
    [aCoder encodeDouble:_lastSeq forKey:kMMCourseLastSeq];
}

- (id)copyWithZone:(NSZone *)zone
{
    MMCourse *copy = [[MMCourse alloc] init];
    
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

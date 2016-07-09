//
//  TMCourse.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "TMCourse.h"


NSString *const kTMCourseStudyNum = @"study_num";
NSString *const kTMCourseLessonCount = @"lesson_count";
NSString *const kTMCourseCreatedAt = @"created_at";
NSString *const kTMCourseFinishLessionCount = @"finish_lession_count";
NSString *const kTMCourseTime = @"time";
NSString *const kTMCourseFavAt = @"fav_at";
NSString *const kTMCourseImg = @"img";
NSString *const kTMCourseTitle = @"title";
NSString *const kTMCourseLevel = @"level";
NSString *const kTMCourseIsFree = @"is_free";
NSString *const kTMCourseCid = @"cid";
NSString *const kTMCourseVisitAt = @"visit_at";
NSString *const kTMCourseIsFav = @"is_fav";
NSString *const kTMCourseLastSeq = @"last_seq";


@interface TMCourse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TMCourse

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
            self.studyNum = [[self objectOrNilForKey:kTMCourseStudyNum fromDictionary:dict] doubleValue];
            self.lessonCount = [[self objectOrNilForKey:kTMCourseLessonCount fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kTMCourseCreatedAt fromDictionary:dict];
            self.finishLessionCount = [[self objectOrNilForKey:kTMCourseFinishLessionCount fromDictionary:dict] doubleValue];
            self.time = [[self objectOrNilForKey:kTMCourseTime fromDictionary:dict] doubleValue];
            self.favAt = [self objectOrNilForKey:kTMCourseFavAt fromDictionary:dict];
            self.img = [self objectOrNilForKey:kTMCourseImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kTMCourseTitle fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kTMCourseLevel fromDictionary:dict] doubleValue];
            self.isFree = [[self objectOrNilForKey:kTMCourseIsFree fromDictionary:dict] doubleValue];
            self.cid = [[self objectOrNilForKey:kTMCourseCid fromDictionary:dict] doubleValue];
            self.visitAt = [self objectOrNilForKey:kTMCourseVisitAt fromDictionary:dict];
            self.isFav = [[self objectOrNilForKey:kTMCourseIsFav fromDictionary:dict] doubleValue];
            self.lastSeq = [[self objectOrNilForKey:kTMCourseLastSeq fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.studyNum] forKey:kTMCourseStudyNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lessonCount] forKey:kTMCourseLessonCount];
    [mutableDict setValue:self.createdAt forKey:kTMCourseCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.finishLessionCount] forKey:kTMCourseFinishLessionCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kTMCourseTime];
    [mutableDict setValue:self.favAt forKey:kTMCourseFavAt];
    [mutableDict setValue:self.img forKey:kTMCourseImg];
    [mutableDict setValue:self.title forKey:kTMCourseTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kTMCourseLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFree] forKey:kTMCourseIsFree];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cid] forKey:kTMCourseCid];
    [mutableDict setValue:self.visitAt forKey:kTMCourseVisitAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFav] forKey:kTMCourseIsFav];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastSeq] forKey:kTMCourseLastSeq];

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

    self.studyNum = [aDecoder decodeDoubleForKey:kTMCourseStudyNum];
    self.lessonCount = [aDecoder decodeDoubleForKey:kTMCourseLessonCount];
    self.createdAt = [aDecoder decodeObjectForKey:kTMCourseCreatedAt];
    self.finishLessionCount = [aDecoder decodeDoubleForKey:kTMCourseFinishLessionCount];
    self.time = [aDecoder decodeDoubleForKey:kTMCourseTime];
    self.favAt = [aDecoder decodeObjectForKey:kTMCourseFavAt];
    self.img = [aDecoder decodeObjectForKey:kTMCourseImg];
    self.title = [aDecoder decodeObjectForKey:kTMCourseTitle];
    self.level = [aDecoder decodeDoubleForKey:kTMCourseLevel];
    self.isFree = [aDecoder decodeDoubleForKey:kTMCourseIsFree];
    self.cid = [aDecoder decodeDoubleForKey:kTMCourseCid];
    self.visitAt = [aDecoder decodeObjectForKey:kTMCourseVisitAt];
    self.isFav = [aDecoder decodeDoubleForKey:kTMCourseIsFav];
    self.lastSeq = [aDecoder decodeDoubleForKey:kTMCourseLastSeq];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_studyNum forKey:kTMCourseStudyNum];
    [aCoder encodeDouble:_lessonCount forKey:kTMCourseLessonCount];
    [aCoder encodeObject:_createdAt forKey:kTMCourseCreatedAt];
    [aCoder encodeDouble:_finishLessionCount forKey:kTMCourseFinishLessionCount];
    [aCoder encodeDouble:_time forKey:kTMCourseTime];
    [aCoder encodeObject:_favAt forKey:kTMCourseFavAt];
    [aCoder encodeObject:_img forKey:kTMCourseImg];
    [aCoder encodeObject:_title forKey:kTMCourseTitle];
    [aCoder encodeDouble:_level forKey:kTMCourseLevel];
    [aCoder encodeDouble:_isFree forKey:kTMCourseIsFree];
    [aCoder encodeDouble:_cid forKey:kTMCourseCid];
    [aCoder encodeObject:_visitAt forKey:kTMCourseVisitAt];
    [aCoder encodeDouble:_isFav forKey:kTMCourseIsFav];
    [aCoder encodeDouble:_lastSeq forKey:kTMCourseLastSeq];
}

- (id)copyWithZone:(NSZone *)zone
{
    TMCourse *copy = [[TMCourse alloc] init];
    
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

//
//  CLMLists.m
//
//  Created by mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLMLists.h"


NSString *const kCLMListsStudyNum = @"study_num";
NSString *const kCLMListsLessonCount = @"lesson_count";
NSString *const kCLMListsCreatedAt = @"created_at";
NSString *const kCLMListsFinishLessionCount = @"finish_lession_count";
NSString *const kCLMListsTime = @"time";
NSString *const kCLMListsFavAt = @"fav_at";
NSString *const kCLMListsImg = @"img";
NSString *const kCLMListsTitle = @"title";
NSString *const kCLMListsLevel = @"level";
NSString *const kCLMListsIsFree = @"is_free";
NSString *const kCLMListsCid = @"cid";
NSString *const kCLMListsVisitAt = @"visit_at";
NSString *const kCLMListsIsFav = @"is_fav";
NSString *const kCLMListsLastSeq = @"last_seq";


@interface CLMLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLMLists

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
            self.studyNum = [[self objectOrNilForKey:kCLMListsStudyNum fromDictionary:dict] doubleValue];
            self.lessonCount = [[self objectOrNilForKey:kCLMListsLessonCount fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kCLMListsCreatedAt fromDictionary:dict];
            self.finishLessionCount = [[self objectOrNilForKey:kCLMListsFinishLessionCount fromDictionary:dict] doubleValue];
            self.time = [[self objectOrNilForKey:kCLMListsTime fromDictionary:dict] doubleValue];
            self.favAt = [self objectOrNilForKey:kCLMListsFavAt fromDictionary:dict];
            self.img = [self objectOrNilForKey:kCLMListsImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCLMListsTitle fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kCLMListsLevel fromDictionary:dict] doubleValue];
            self.isFree = [[self objectOrNilForKey:kCLMListsIsFree fromDictionary:dict] doubleValue];
            self.cid = [[self objectOrNilForKey:kCLMListsCid fromDictionary:dict] doubleValue];
            self.visitAt = [self objectOrNilForKey:kCLMListsVisitAt fromDictionary:dict];
            self.isFav = [[self objectOrNilForKey:kCLMListsIsFav fromDictionary:dict] doubleValue];
            self.lastSeq = [[self objectOrNilForKey:kCLMListsLastSeq fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.studyNum] forKey:kCLMListsStudyNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lessonCount] forKey:kCLMListsLessonCount];
    [mutableDict setValue:self.createdAt forKey:kCLMListsCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.finishLessionCount] forKey:kCLMListsFinishLessionCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kCLMListsTime];
    [mutableDict setValue:self.favAt forKey:kCLMListsFavAt];
    [mutableDict setValue:self.img forKey:kCLMListsImg];
    [mutableDict setValue:self.title forKey:kCLMListsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kCLMListsLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFree] forKey:kCLMListsIsFree];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cid] forKey:kCLMListsCid];
    [mutableDict setValue:self.visitAt forKey:kCLMListsVisitAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFav] forKey:kCLMListsIsFav];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastSeq] forKey:kCLMListsLastSeq];

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

    self.studyNum = [aDecoder decodeDoubleForKey:kCLMListsStudyNum];
    self.lessonCount = [aDecoder decodeDoubleForKey:kCLMListsLessonCount];
    self.createdAt = [aDecoder decodeObjectForKey:kCLMListsCreatedAt];
    self.finishLessionCount = [aDecoder decodeDoubleForKey:kCLMListsFinishLessionCount];
    self.time = [aDecoder decodeDoubleForKey:kCLMListsTime];
    self.favAt = [aDecoder decodeObjectForKey:kCLMListsFavAt];
    self.img = [aDecoder decodeObjectForKey:kCLMListsImg];
    self.title = [aDecoder decodeObjectForKey:kCLMListsTitle];
    self.level = [aDecoder decodeDoubleForKey:kCLMListsLevel];
    self.isFree = [aDecoder decodeDoubleForKey:kCLMListsIsFree];
    self.cid = [aDecoder decodeDoubleForKey:kCLMListsCid];
    self.visitAt = [aDecoder decodeObjectForKey:kCLMListsVisitAt];
    self.isFav = [aDecoder decodeDoubleForKey:kCLMListsIsFav];
    self.lastSeq = [aDecoder decodeDoubleForKey:kCLMListsLastSeq];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_studyNum forKey:kCLMListsStudyNum];
    [aCoder encodeDouble:_lessonCount forKey:kCLMListsLessonCount];
    [aCoder encodeObject:_createdAt forKey:kCLMListsCreatedAt];
    [aCoder encodeDouble:_finishLessionCount forKey:kCLMListsFinishLessionCount];
    [aCoder encodeDouble:_time forKey:kCLMListsTime];
    [aCoder encodeObject:_favAt forKey:kCLMListsFavAt];
    [aCoder encodeObject:_img forKey:kCLMListsImg];
    [aCoder encodeObject:_title forKey:kCLMListsTitle];
    [aCoder encodeDouble:_level forKey:kCLMListsLevel];
    [aCoder encodeDouble:_isFree forKey:kCLMListsIsFree];
    [aCoder encodeDouble:_cid forKey:kCLMListsCid];
    [aCoder encodeObject:_visitAt forKey:kCLMListsVisitAt];
    [aCoder encodeDouble:_isFav forKey:kCLMListsIsFav];
    [aCoder encodeDouble:_lastSeq forKey:kCLMListsLastSeq];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLMLists *copy = [[CLMLists alloc] init];
    
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

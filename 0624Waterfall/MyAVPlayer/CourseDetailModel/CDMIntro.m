//
//  CDMIntro.m
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CDMIntro.h"


NSString *const kCDMIntroIsFav = @"is_fav";
NSString *const kCDMIntroCateId = @"cate_id";
NSString *const kCDMIntroImg = @"img";
NSString *const kCDMIntroLastSeq = @"last_seq";
NSString *const kCDMIntroLessonCount = @"lesson_count";
NSString *const kCDMIntroFavorite = @"favorite";
NSString *const kCDMIntroTitle = @"title";
NSString *const kCDMIntroCourseIntro = @"course_intro";
NSString *const kCDMIntroLearnNum = @"learn_num";
NSString *const kCDMIntroIsFree = @"is_free";
NSString *const kCDMIntroCid = @"cid";


@interface CDMIntro ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CDMIntro

@synthesize isFav = _isFav;
@synthesize cateId = _cateId;
@synthesize img = _img;
@synthesize lastSeq = _lastSeq;
@synthesize lessonCount = _lessonCount;
@synthesize favorite = _favorite;
@synthesize title = _title;
@synthesize courseIntro = _courseIntro;
@synthesize learnNum = _learnNum;
@synthesize isFree = _isFree;
@synthesize cid = _cid;


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
            self.isFav = [[self objectOrNilForKey:kCDMIntroIsFav fromDictionary:dict] doubleValue];
            self.cateId = [self objectOrNilForKey:kCDMIntroCateId fromDictionary:dict];
            self.img = [self objectOrNilForKey:kCDMIntroImg fromDictionary:dict];
            self.lastSeq = [[self objectOrNilForKey:kCDMIntroLastSeq fromDictionary:dict] doubleValue];
            self.lessonCount = [[self objectOrNilForKey:kCDMIntroLessonCount fromDictionary:dict] doubleValue];
            self.favorite = [[self objectOrNilForKey:kCDMIntroFavorite fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kCDMIntroTitle fromDictionary:dict];
            self.courseIntro = [self objectOrNilForKey:kCDMIntroCourseIntro fromDictionary:dict];
            self.learnNum = [[self objectOrNilForKey:kCDMIntroLearnNum fromDictionary:dict] doubleValue];
            self.isFree = [[self objectOrNilForKey:kCDMIntroIsFree fromDictionary:dict] doubleValue];
            self.cid = [[self objectOrNilForKey:kCDMIntroCid fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFav] forKey:kCDMIntroIsFav];
    [mutableDict setValue:self.cateId forKey:kCDMIntroCateId];
    [mutableDict setValue:self.img forKey:kCDMIntroImg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastSeq] forKey:kCDMIntroLastSeq];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lessonCount] forKey:kCDMIntroLessonCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favorite] forKey:kCDMIntroFavorite];
    [mutableDict setValue:self.title forKey:kCDMIntroTitle];
    [mutableDict setValue:self.courseIntro forKey:kCDMIntroCourseIntro];
    [mutableDict setValue:[NSNumber numberWithDouble:self.learnNum] forKey:kCDMIntroLearnNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFree] forKey:kCDMIntroIsFree];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cid] forKey:kCDMIntroCid];

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

    self.isFav = [aDecoder decodeDoubleForKey:kCDMIntroIsFav];
    self.cateId = [aDecoder decodeObjectForKey:kCDMIntroCateId];
    self.img = [aDecoder decodeObjectForKey:kCDMIntroImg];
    self.lastSeq = [aDecoder decodeDoubleForKey:kCDMIntroLastSeq];
    self.lessonCount = [aDecoder decodeDoubleForKey:kCDMIntroLessonCount];
    self.favorite = [aDecoder decodeDoubleForKey:kCDMIntroFavorite];
    self.title = [aDecoder decodeObjectForKey:kCDMIntroTitle];
    self.courseIntro = [aDecoder decodeObjectForKey:kCDMIntroCourseIntro];
    self.learnNum = [aDecoder decodeDoubleForKey:kCDMIntroLearnNum];
    self.isFree = [aDecoder decodeDoubleForKey:kCDMIntroIsFree];
    self.cid = [aDecoder decodeDoubleForKey:kCDMIntroCid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isFav forKey:kCDMIntroIsFav];
    [aCoder encodeObject:_cateId forKey:kCDMIntroCateId];
    [aCoder encodeObject:_img forKey:kCDMIntroImg];
    [aCoder encodeDouble:_lastSeq forKey:kCDMIntroLastSeq];
    [aCoder encodeDouble:_lessonCount forKey:kCDMIntroLessonCount];
    [aCoder encodeDouble:_favorite forKey:kCDMIntroFavorite];
    [aCoder encodeObject:_title forKey:kCDMIntroTitle];
    [aCoder encodeObject:_courseIntro forKey:kCDMIntroCourseIntro];
    [aCoder encodeDouble:_learnNum forKey:kCDMIntroLearnNum];
    [aCoder encodeDouble:_isFree forKey:kCDMIntroIsFree];
    [aCoder encodeDouble:_cid forKey:kCDMIntroCid];
}

- (id)copyWithZone:(NSZone *)zone
{
    CDMIntro *copy = [[CDMIntro alloc] init];
    
    if (copy) {

        copy.isFav = self.isFav;
        copy.cateId = [self.cateId copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.lastSeq = self.lastSeq;
        copy.lessonCount = self.lessonCount;
        copy.favorite = self.favorite;
        copy.title = [self.title copyWithZone:zone];
        copy.courseIntro = [self.courseIntro copyWithZone:zone];
        copy.learnNum = self.learnNum;
        copy.isFree = self.isFree;
        copy.cid = self.cid;
    }
    
    return copy;
}


@end

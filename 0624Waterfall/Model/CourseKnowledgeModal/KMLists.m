//
//  KMLists.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "KMLists.h"


NSString *const kKMListsCateId = @"cate_id";
NSString *const kKMListsLessonCount = @"lesson_count";
NSString *const kKMListsCourseVideoLength = @"course_video_length";
NSString *const kKMListsTitle = @"title";
NSString *const kKMListsCourseCount = @"course_count";
NSString *const kKMListsCourseLearnNum = @"course_learn_num";
NSString *const kKMListsDescription = @"description";
NSString *const kKMListsIcon = @"icon";


@interface KMLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation KMLists

@synthesize cateId = _cateId;
@synthesize lessonCount = _lessonCount;
@synthesize courseVideoLength = _courseVideoLength;
@synthesize title = _title;
@synthesize courseCount = _courseCount;
@synthesize courseLearnNum = _courseLearnNum;
@synthesize listsDescription = _listsDescription;
@synthesize icon = _icon;


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
            self.cateId = [[self objectOrNilForKey:kKMListsCateId fromDictionary:dict] doubleValue];
            self.lessonCount = [[self objectOrNilForKey:kKMListsLessonCount fromDictionary:dict] doubleValue];
            self.courseVideoLength = [[self objectOrNilForKey:kKMListsCourseVideoLength fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kKMListsTitle fromDictionary:dict];
            self.courseCount = [[self objectOrNilForKey:kKMListsCourseCount fromDictionary:dict] doubleValue];
            self.courseLearnNum = [[self objectOrNilForKey:kKMListsCourseLearnNum fromDictionary:dict] doubleValue];
            self.listsDescription = [self objectOrNilForKey:kKMListsDescription fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kKMListsIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cateId] forKey:kKMListsCateId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lessonCount] forKey:kKMListsLessonCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.courseVideoLength] forKey:kKMListsCourseVideoLength];
    [mutableDict setValue:self.title forKey:kKMListsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.courseCount] forKey:kKMListsCourseCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.courseLearnNum] forKey:kKMListsCourseLearnNum];
    [mutableDict setValue:self.listsDescription forKey:kKMListsDescription];
    [mutableDict setValue:self.icon forKey:kKMListsIcon];

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

    self.cateId = [aDecoder decodeDoubleForKey:kKMListsCateId];
    self.lessonCount = [aDecoder decodeDoubleForKey:kKMListsLessonCount];
    self.courseVideoLength = [aDecoder decodeDoubleForKey:kKMListsCourseVideoLength];
    self.title = [aDecoder decodeObjectForKey:kKMListsTitle];
    self.courseCount = [aDecoder decodeDoubleForKey:kKMListsCourseCount];
    self.courseLearnNum = [aDecoder decodeDoubleForKey:kKMListsCourseLearnNum];
    self.listsDescription = [aDecoder decodeObjectForKey:kKMListsDescription];
    self.icon = [aDecoder decodeObjectForKey:kKMListsIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cateId forKey:kKMListsCateId];
    [aCoder encodeDouble:_lessonCount forKey:kKMListsLessonCount];
    [aCoder encodeDouble:_courseVideoLength forKey:kKMListsCourseVideoLength];
    [aCoder encodeObject:_title forKey:kKMListsTitle];
    [aCoder encodeDouble:_courseCount forKey:kKMListsCourseCount];
    [aCoder encodeDouble:_courseLearnNum forKey:kKMListsCourseLearnNum];
    [aCoder encodeObject:_listsDescription forKey:kKMListsDescription];
    [aCoder encodeObject:_icon forKey:kKMListsIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    KMLists *copy = [[KMLists alloc] init];
    
    if (copy) {

        copy.cateId = self.cateId;
        copy.lessonCount = self.lessonCount;
        copy.courseVideoLength = self.courseVideoLength;
        copy.title = [self.title copyWithZone:zone];
        copy.courseCount = self.courseCount;
        copy.courseLearnNum = self.courseLearnNum;
        copy.listsDescription = [self.listsDescription copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
    }
    
    return copy;
}


@end

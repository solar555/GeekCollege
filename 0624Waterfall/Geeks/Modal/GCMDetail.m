//
//  GCMDetail.m
//
//  Created by mac  on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GCMDetail.h"


NSString *const kGCMDetailLessonNum = @"lesson_num";
NSString *const kGCMDetailContributor = @"contributor";
NSString *const kGCMDetailImg = @"img";
NSString *const kGCMDetailCourseLength = @"course_length";
NSString *const kGCMDetailLearnNum = @"learn_num";


@interface GCMDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GCMDetail

@synthesize lessonNum = _lessonNum;
@synthesize contributor = _contributor;
@synthesize img = _img;
@synthesize courseLength = _courseLength;
@synthesize learnNum = _learnNum;


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
            self.lessonNum = [[self objectOrNilForKey:kGCMDetailLessonNum fromDictionary:dict] doubleValue];
            self.contributor = [self objectOrNilForKey:kGCMDetailContributor fromDictionary:dict];
            self.img = [self objectOrNilForKey:kGCMDetailImg fromDictionary:dict];
            self.courseLength = [[self objectOrNilForKey:kGCMDetailCourseLength fromDictionary:dict] doubleValue];
            self.learnNum = [self objectOrNilForKey:kGCMDetailLearnNum fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lessonNum] forKey:kGCMDetailLessonNum];
    [mutableDict setValue:self.contributor forKey:kGCMDetailContributor];
    [mutableDict setValue:self.img forKey:kGCMDetailImg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.courseLength] forKey:kGCMDetailCourseLength];
    [mutableDict setValue:self.learnNum forKey:kGCMDetailLearnNum];

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

    self.lessonNum = [aDecoder decodeDoubleForKey:kGCMDetailLessonNum];
    self.contributor = [aDecoder decodeObjectForKey:kGCMDetailContributor];
    self.img = [aDecoder decodeObjectForKey:kGCMDetailImg];
    self.courseLength = [aDecoder decodeDoubleForKey:kGCMDetailCourseLength];
    self.learnNum = [aDecoder decodeObjectForKey:kGCMDetailLearnNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_lessonNum forKey:kGCMDetailLessonNum];
    [aCoder encodeObject:_contributor forKey:kGCMDetailContributor];
    [aCoder encodeObject:_img forKey:kGCMDetailImg];
    [aCoder encodeDouble:_courseLength forKey:kGCMDetailCourseLength];
    [aCoder encodeObject:_learnNum forKey:kGCMDetailLearnNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    GCMDetail *copy = [[GCMDetail alloc] init];
    
    if (copy) {

        copy.lessonNum = self.lessonNum;
        copy.contributor = [self.contributor copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.courseLength = self.courseLength;
        copy.learnNum = [self.learnNum copyWithZone:zone];
    }
    
    return copy;
}


@end

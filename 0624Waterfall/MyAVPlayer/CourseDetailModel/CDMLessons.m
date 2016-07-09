//
//  CDMLessons.m
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CDMLessons.h"


NSString *const kCDMLessonsLength = @"length";
NSString *const kCDMLessonsVideoPlay = @"video_play";
NSString *const kCDMLessonsContent = @"content";
NSString *const kCDMLessonsId = @"id";
NSString *const kCDMLessonsVideoDownload = @"video_download";
NSString *const kCDMLessonsTitle = @"title";
NSString *const kCDMLessonsIsFinish = @"is_finish";


@interface CDMLessons ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CDMLessons

@synthesize length = _length;
@synthesize videoPlay = _videoPlay;
@synthesize content = _content;
@synthesize lessonsIdentifier = _lessonsIdentifier;
@synthesize videoDownload = _videoDownload;
@synthesize title = _title;
@synthesize isFinish = _isFinish;


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
            self.length = [self objectOrNilForKey:kCDMLessonsLength fromDictionary:dict];
            self.videoPlay = [[self objectOrNilForKey:kCDMLessonsVideoPlay fromDictionary:dict] boolValue];
            self.content = [self objectOrNilForKey:kCDMLessonsContent fromDictionary:dict];
            self.lessonsIdentifier = [[self objectOrNilForKey:kCDMLessonsId fromDictionary:dict] doubleValue];
            self.videoDownload = [[self objectOrNilForKey:kCDMLessonsVideoDownload fromDictionary:dict] boolValue];
            self.title = [self objectOrNilForKey:kCDMLessonsTitle fromDictionary:dict];
            self.isFinish = [[self objectOrNilForKey:kCDMLessonsIsFinish fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.length forKey:kCDMLessonsLength];
    [mutableDict setValue:[NSNumber numberWithBool:self.videoPlay] forKey:kCDMLessonsVideoPlay];
    [mutableDict setValue:self.content forKey:kCDMLessonsContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lessonsIdentifier] forKey:kCDMLessonsId];
    [mutableDict setValue:[NSNumber numberWithBool:self.videoDownload] forKey:kCDMLessonsVideoDownload];
    [mutableDict setValue:self.title forKey:kCDMLessonsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFinish] forKey:kCDMLessonsIsFinish];

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

    self.length = [aDecoder decodeObjectForKey:kCDMLessonsLength];
    self.videoPlay = [aDecoder decodeBoolForKey:kCDMLessonsVideoPlay];
    self.content = [aDecoder decodeObjectForKey:kCDMLessonsContent];
    self.lessonsIdentifier = [aDecoder decodeDoubleForKey:kCDMLessonsId];
    self.videoDownload = [aDecoder decodeBoolForKey:kCDMLessonsVideoDownload];
    self.title = [aDecoder decodeObjectForKey:kCDMLessonsTitle];
    self.isFinish = [aDecoder decodeDoubleForKey:kCDMLessonsIsFinish];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_length forKey:kCDMLessonsLength];
    [aCoder encodeBool:_videoPlay forKey:kCDMLessonsVideoPlay];
    [aCoder encodeObject:_content forKey:kCDMLessonsContent];
    [aCoder encodeDouble:_lessonsIdentifier forKey:kCDMLessonsId];
    [aCoder encodeBool:_videoDownload forKey:kCDMLessonsVideoDownload];
    [aCoder encodeObject:_title forKey:kCDMLessonsTitle];
    [aCoder encodeDouble:_isFinish forKey:kCDMLessonsIsFinish];
}

- (id)copyWithZone:(NSZone *)zone
{
    CDMLessons *copy = [[CDMLessons alloc] init];
    
    if (copy) {

        copy.length = [self.length copyWithZone:zone];
        copy.videoPlay = self.videoPlay;
        copy.content = [self.content copyWithZone:zone];
        copy.lessonsIdentifier = self.lessonsIdentifier;
        copy.videoDownload = self.videoDownload;
        copy.title = [self.title copyWithZone:zone];
        copy.isFinish = self.isFinish;
    }
    
    return copy;
}


@end

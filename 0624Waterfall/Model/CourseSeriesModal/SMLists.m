//
//  SMLists.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SMLists.h"


NSString *const kSMListsCollectStatus = @"collect_status";
NSString *const kSMListsId = @"id";
NSString *const kSMListsTitle = @"title";
NSString *const kSMListsStudyCount = @"study_count";
NSString *const kSMListsImageApp = @"image_app";


@interface SMLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SMLists

@synthesize collectStatus = _collectStatus;
@synthesize listsIdentifier = _listsIdentifier;
@synthesize title = _title;
@synthesize studyCount = _studyCount;
@synthesize imageApp = _imageApp;


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
            self.collectStatus = [[self objectOrNilForKey:kSMListsCollectStatus fromDictionary:dict] doubleValue];
            self.listsIdentifier = [self objectOrNilForKey:kSMListsId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSMListsTitle fromDictionary:dict];
            self.studyCount = [self objectOrNilForKey:kSMListsStudyCount fromDictionary:dict];
            self.imageApp = [self objectOrNilForKey:kSMListsImageApp fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.collectStatus] forKey:kSMListsCollectStatus];
    [mutableDict setValue:self.listsIdentifier forKey:kSMListsId];
    [mutableDict setValue:self.title forKey:kSMListsTitle];
    [mutableDict setValue:self.studyCount forKey:kSMListsStudyCount];
    [mutableDict setValue:self.imageApp forKey:kSMListsImageApp];

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

    self.collectStatus = [aDecoder decodeDoubleForKey:kSMListsCollectStatus];
    self.listsIdentifier = [aDecoder decodeObjectForKey:kSMListsId];
    self.title = [aDecoder decodeObjectForKey:kSMListsTitle];
    self.studyCount = [aDecoder decodeObjectForKey:kSMListsStudyCount];
    self.imageApp = [aDecoder decodeObjectForKey:kSMListsImageApp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_collectStatus forKey:kSMListsCollectStatus];
    [aCoder encodeObject:_listsIdentifier forKey:kSMListsId];
    [aCoder encodeObject:_title forKey:kSMListsTitle];
    [aCoder encodeObject:_studyCount forKey:kSMListsStudyCount];
    [aCoder encodeObject:_imageApp forKey:kSMListsImageApp];
}

- (id)copyWithZone:(NSZone *)zone
{
    SMLists *copy = [[SMLists alloc] init];
    
    if (copy) {

        copy.collectStatus = self.collectStatus;
        copy.listsIdentifier = [self.listsIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.studyCount = [self.studyCount copyWithZone:zone];
        copy.imageApp = [self.imageApp copyWithZone:zone];
    }
    
    return copy;
}


@end

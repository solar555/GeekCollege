//
//  TMLists.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "TMLists.h"
#import "TMCourse.h"


NSString *const kTMListsTitle = @"title";
NSString *const kTMListsSlug = @"slug";
NSString *const kTMListsCourse = @"course";


@interface TMLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TMLists

@synthesize title = _title;
@synthesize slug = _slug;
@synthesize course = _course;


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
            self.title = [self objectOrNilForKey:kTMListsTitle fromDictionary:dict];
            self.slug = [self objectOrNilForKey:kTMListsSlug fromDictionary:dict];
    NSObject *receivedTMCourse = [dict objectForKey:kTMListsCourse];
    NSMutableArray *parsedTMCourse = [NSMutableArray array];
    if ([receivedTMCourse isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTMCourse) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTMCourse addObject:[TMCourse modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTMCourse isKindOfClass:[NSDictionary class]]) {
       [parsedTMCourse addObject:[TMCourse modelObjectWithDictionary:(NSDictionary *)receivedTMCourse]];
    }

    self.course = [NSArray arrayWithArray:parsedTMCourse];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kTMListsTitle];
    [mutableDict setValue:self.slug forKey:kTMListsSlug];
    NSMutableArray *tempArrayForCourse = [NSMutableArray array];
    for (NSObject *subArrayObject in self.course) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCourse addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCourse addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCourse] forKey:kTMListsCourse];

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

    self.title = [aDecoder decodeObjectForKey:kTMListsTitle];
    self.slug = [aDecoder decodeObjectForKey:kTMListsSlug];
    self.course = [aDecoder decodeObjectForKey:kTMListsCourse];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kTMListsTitle];
    [aCoder encodeObject:_slug forKey:kTMListsSlug];
    [aCoder encodeObject:_course forKey:kTMListsCourse];
}

- (id)copyWithZone:(NSZone *)zone
{
    TMLists *copy = [[TMLists alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.slug = [self.slug copyWithZone:zone];
        copy.course = [self.course copyWithZone:zone];
    }
    
    return copy;
}


@end

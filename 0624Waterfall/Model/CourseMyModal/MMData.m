//
//  MMData.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MMData.h"
#import "MMCourse.h"


NSString *const kMMDataTitle = @"title";
NSString *const kMMDataSlug = @"slug";
NSString *const kMMDataCourse = @"course";


@interface MMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MMData

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
            self.title = [self objectOrNilForKey:kMMDataTitle fromDictionary:dict];
            self.slug = [self objectOrNilForKey:kMMDataSlug fromDictionary:dict];
    NSObject *receivedMMCourse = [dict objectForKey:kMMDataCourse];
    NSMutableArray *parsedMMCourse = [NSMutableArray array];
    if ([receivedMMCourse isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMMCourse) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMMCourse addObject:[MMCourse modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMMCourse isKindOfClass:[NSDictionary class]]) {
       [parsedMMCourse addObject:[MMCourse modelObjectWithDictionary:(NSDictionary *)receivedMMCourse]];
    }

    self.course = [NSArray arrayWithArray:parsedMMCourse];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kMMDataTitle];
    [mutableDict setValue:self.slug forKey:kMMDataSlug];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCourse] forKey:kMMDataCourse];

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

    self.title = [aDecoder decodeObjectForKey:kMMDataTitle];
    self.slug = [aDecoder decodeObjectForKey:kMMDataSlug];
    self.course = [aDecoder decodeObjectForKey:kMMDataCourse];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kMMDataTitle];
    [aCoder encodeObject:_slug forKey:kMMDataSlug];
    [aCoder encodeObject:_course forKey:kMMDataCourse];
}

- (id)copyWithZone:(NSZone *)zone
{
    MMData *copy = [[MMData alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.slug = [self.slug copyWithZone:zone];
        copy.course = [self.course copyWithZone:zone];
    }
    
    return copy;
}


@end

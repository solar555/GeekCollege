//
//  CDMData.m
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CDMData.h"
#import "CDMIntro.h"
#import "CDMLessons.h"
#import "CDMRelated.h"


NSString *const kCDMDataIntro = @"intro";
NSString *const kCDMDataLessons = @"lessons";
NSString *const kCDMDataRelated = @"related";


@interface CDMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CDMData

@synthesize intro = _intro;
@synthesize lessons = _lessons;
@synthesize related = _related;


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
            self.intro = [CDMIntro modelObjectWithDictionary:[dict objectForKey:kCDMDataIntro]];
    NSObject *receivedCDMLessons = [dict objectForKey:kCDMDataLessons];
    NSMutableArray *parsedCDMLessons = [NSMutableArray array];
    if ([receivedCDMLessons isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCDMLessons) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCDMLessons addObject:[CDMLessons modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCDMLessons isKindOfClass:[NSDictionary class]]) {
       [parsedCDMLessons addObject:[CDMLessons modelObjectWithDictionary:(NSDictionary *)receivedCDMLessons]];
    }

    self.lessons = [NSArray arrayWithArray:parsedCDMLessons];
    NSObject *receivedCDMRelated = [dict objectForKey:kCDMDataRelated];
    NSMutableArray *parsedCDMRelated = [NSMutableArray array];
    if ([receivedCDMRelated isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCDMRelated) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCDMRelated addObject:[CDMRelated modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCDMRelated isKindOfClass:[NSDictionary class]]) {
       [parsedCDMRelated addObject:[CDMRelated modelObjectWithDictionary:(NSDictionary *)receivedCDMRelated]];
    }

    self.related = [NSArray arrayWithArray:parsedCDMRelated];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.intro dictionaryRepresentation] forKey:kCDMDataIntro];
    NSMutableArray *tempArrayForLessons = [NSMutableArray array];
    for (NSObject *subArrayObject in self.lessons) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLessons addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLessons addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLessons] forKey:kCDMDataLessons];
    NSMutableArray *tempArrayForRelated = [NSMutableArray array];
    for (NSObject *subArrayObject in self.related) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRelated addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRelated addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRelated] forKey:kCDMDataRelated];

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

    self.intro = [aDecoder decodeObjectForKey:kCDMDataIntro];
    self.lessons = [aDecoder decodeObjectForKey:kCDMDataLessons];
    self.related = [aDecoder decodeObjectForKey:kCDMDataRelated];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_intro forKey:kCDMDataIntro];
    [aCoder encodeObject:_lessons forKey:kCDMDataLessons];
    [aCoder encodeObject:_related forKey:kCDMDataRelated];
}

- (id)copyWithZone:(NSZone *)zone
{
    CDMData *copy = [[CDMData alloc] init];
    
    if (copy) {

        copy.intro = [self.intro copyWithZone:zone];
        copy.lessons = [self.lessons copyWithZone:zone];
        copy.related = [self.related copyWithZone:zone];
    }
    
    return copy;
}


@end

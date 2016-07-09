//
//  PMData.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PMData.h"
#import "PMLists.h"


NSString *const kPMDataLists = @"lists";


@interface PMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PMData

@synthesize lists = _lists;


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
    NSObject *receivedPMLists = [dict objectForKey:kPMDataLists];
    NSMutableArray *parsedPMLists = [NSMutableArray array];
    if ([receivedPMLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPMLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPMLists addObject:[PMLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPMLists isKindOfClass:[NSDictionary class]]) {
       [parsedPMLists addObject:[PMLists modelObjectWithDictionary:(NSDictionary *)receivedPMLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedPMLists];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLists = [NSMutableArray array];
    for (NSObject *subArrayObject in self.lists) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLists addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLists addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kPMDataLists];

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

    self.lists = [aDecoder decodeObjectForKey:kPMDataLists];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lists forKey:kPMDataLists];
}

- (id)copyWithZone:(NSZone *)zone
{
    PMData *copy = [[PMData alloc] init];
    
    if (copy) {

        copy.lists = [self.lists copyWithZone:zone];
    }
    
    return copy;
}


@end

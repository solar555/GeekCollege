//
//  KMData.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "KMData.h"
#import "KMLists.h"


NSString *const kKMDataLists = @"lists";


@interface KMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation KMData

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
    NSObject *receivedKMLists = [dict objectForKey:kKMDataLists];
    NSMutableArray *parsedKMLists = [NSMutableArray array];
    if ([receivedKMLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedKMLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedKMLists addObject:[KMLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedKMLists isKindOfClass:[NSDictionary class]]) {
       [parsedKMLists addObject:[KMLists modelObjectWithDictionary:(NSDictionary *)receivedKMLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedKMLists];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kKMDataLists];

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

    self.lists = [aDecoder decodeObjectForKey:kKMDataLists];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lists forKey:kKMDataLists];
}

- (id)copyWithZone:(NSZone *)zone
{
    KMData *copy = [[KMData alloc] init];
    
    if (copy) {

        copy.lists = [self.lists copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  BMData.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BMData.h"
#import "BMLists.h"


NSString *const kBMDataLists = @"lists";


@interface BMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BMData

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
    NSObject *receivedBMLists = [dict objectForKey:kBMDataLists];
    NSMutableArray *parsedBMLists = [NSMutableArray array];
    if ([receivedBMLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBMLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBMLists addObject:[BMLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBMLists isKindOfClass:[NSDictionary class]]) {
       [parsedBMLists addObject:[BMLists modelObjectWithDictionary:(NSDictionary *)receivedBMLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedBMLists];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kBMDataLists];

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

    self.lists = [aDecoder decodeObjectForKey:kBMDataLists];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lists forKey:kBMDataLists];
}

- (id)copyWithZone:(NSZone *)zone
{
    BMData *copy = [[BMData alloc] init];
    
    if (copy) {

        copy.lists = [self.lists copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  CLMMData.m
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLMMData.h"
#import "CLMMLists.h"


NSString *const kCLMMDataLists = @"lists";


@interface CLMMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLMMData

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
    NSObject *receivedCLMMLists = [dict objectForKey:kCLMMDataLists];
    NSMutableArray *parsedCLMMLists = [NSMutableArray array];
    if ([receivedCLMMLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCLMMLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCLMMLists addObject:[CLMMLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCLMMLists isKindOfClass:[NSDictionary class]]) {
       [parsedCLMMLists addObject:[CLMMLists modelObjectWithDictionary:(NSDictionary *)receivedCLMMLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedCLMMLists];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kCLMMDataLists];

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

    self.lists = [aDecoder decodeObjectForKey:kCLMMDataLists];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lists forKey:kCLMMDataLists];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLMMData *copy = [[CLMMData alloc] init];
    
    if (copy) {

        copy.lists = [self.lists copyWithZone:zone];
    }
    
    return copy;
}


@end

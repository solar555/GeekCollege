//
//  SMData.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SMData.h"
#import "SMLists.h"


NSString *const kSMDataIsEnd = @"is_end";
NSString *const kSMDataLists = @"lists";


@interface SMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SMData

@synthesize isEnd = _isEnd;
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
            self.isEnd = [[self objectOrNilForKey:kSMDataIsEnd fromDictionary:dict] doubleValue];
    NSObject *receivedSMLists = [dict objectForKey:kSMDataLists];
    NSMutableArray *parsedSMLists = [NSMutableArray array];
    if ([receivedSMLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSMLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSMLists addObject:[SMLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSMLists isKindOfClass:[NSDictionary class]]) {
       [parsedSMLists addObject:[SMLists modelObjectWithDictionary:(NSDictionary *)receivedSMLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedSMLists];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isEnd] forKey:kSMDataIsEnd];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kSMDataLists];

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

    self.isEnd = [aDecoder decodeDoubleForKey:kSMDataIsEnd];
    self.lists = [aDecoder decodeObjectForKey:kSMDataLists];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isEnd forKey:kSMDataIsEnd];
    [aCoder encodeObject:_lists forKey:kSMDataLists];
}

- (id)copyWithZone:(NSZone *)zone
{
    SMData *copy = [[SMData alloc] init];
    
    if (copy) {

        copy.isEnd = self.isEnd;
        copy.lists = [self.lists copyWithZone:zone];
    }
    
    return copy;
}


@end

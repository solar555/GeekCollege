//
//  HMData.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HMData.h"
#import "HMLists.h"


NSString *const kHMDataTotalPages = @"total_pages";
NSString *const kHMDataPageItems = @"page_items";
NSString *const kHMDataTotalItems = @"total_items";
NSString *const kHMDataLists = @"lists";
NSString *const kHMDataPage = @"page";


@interface HMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HMData

@synthesize totalPages = _totalPages;
@synthesize pageItems = _pageItems;
@synthesize totalItems = _totalItems;
@synthesize lists = _lists;
@synthesize page = _page;


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
            self.totalPages = [[self objectOrNilForKey:kHMDataTotalPages fromDictionary:dict] doubleValue];
            self.pageItems = [[self objectOrNilForKey:kHMDataPageItems fromDictionary:dict] doubleValue];
            self.totalItems = [[self objectOrNilForKey:kHMDataTotalItems fromDictionary:dict] doubleValue];
    NSObject *receivedHMLists = [dict objectForKey:kHMDataLists];
    NSMutableArray *parsedHMLists = [NSMutableArray array];
    if ([receivedHMLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHMLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHMLists addObject:[HMLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHMLists isKindOfClass:[NSDictionary class]]) {
       [parsedHMLists addObject:[HMLists modelObjectWithDictionary:(NSDictionary *)receivedHMLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedHMLists];
            self.page = [[self objectOrNilForKey:kHMDataPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPages] forKey:kHMDataTotalPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageItems] forKey:kHMDataPageItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalItems] forKey:kHMDataTotalItems];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kHMDataLists];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kHMDataPage];

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

    self.totalPages = [aDecoder decodeDoubleForKey:kHMDataTotalPages];
    self.pageItems = [aDecoder decodeDoubleForKey:kHMDataPageItems];
    self.totalItems = [aDecoder decodeDoubleForKey:kHMDataTotalItems];
    self.lists = [aDecoder decodeObjectForKey:kHMDataLists];
    self.page = [aDecoder decodeDoubleForKey:kHMDataPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_totalPages forKey:kHMDataTotalPages];
    [aCoder encodeDouble:_pageItems forKey:kHMDataPageItems];
    [aCoder encodeDouble:_totalItems forKey:kHMDataTotalItems];
    [aCoder encodeObject:_lists forKey:kHMDataLists];
    [aCoder encodeDouble:_page forKey:kHMDataPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    HMData *copy = [[HMData alloc] init];
    
    if (copy) {

        copy.totalPages = self.totalPages;
        copy.pageItems = self.pageItems;
        copy.totalItems = self.totalItems;
        copy.lists = [self.lists copyWithZone:zone];
        copy.page = self.page;
    }
    
    return copy;
}


@end

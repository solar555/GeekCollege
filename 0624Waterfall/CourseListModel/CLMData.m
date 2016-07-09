//
//  CLMData.m
//
//  Created by mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLMData.h"
#import "CLMLists.h"


NSString *const kCLMDataCateId = @"cate_id";
NSString *const kCLMDataTotalPages = @"total_pages";
NSString *const kCLMDataPageItems = @"page_items";
NSString *const kCLMDataTotalItems = @"total_items";
NSString *const kCLMDataLists = @"lists";
NSString *const kCLMDataPage = @"page";


@interface CLMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLMData

@synthesize cateId = _cateId;
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
            self.cateId = [[self objectOrNilForKey:kCLMDataCateId fromDictionary:dict] doubleValue];
            self.totalPages = [[self objectOrNilForKey:kCLMDataTotalPages fromDictionary:dict] doubleValue];
            self.pageItems = [[self objectOrNilForKey:kCLMDataPageItems fromDictionary:dict] doubleValue];
            self.totalItems = [[self objectOrNilForKey:kCLMDataTotalItems fromDictionary:dict] doubleValue];
    NSObject *receivedCLMLists = [dict objectForKey:kCLMDataLists];
    NSMutableArray *parsedCLMLists = [NSMutableArray array];
    if ([receivedCLMLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCLMLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCLMLists addObject:[CLMLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCLMLists isKindOfClass:[NSDictionary class]]) {
       [parsedCLMLists addObject:[CLMLists modelObjectWithDictionary:(NSDictionary *)receivedCLMLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedCLMLists];
            self.page = [[self objectOrNilForKey:kCLMDataPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cateId] forKey:kCLMDataCateId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPages] forKey:kCLMDataTotalPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageItems] forKey:kCLMDataPageItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalItems] forKey:kCLMDataTotalItems];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kCLMDataLists];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kCLMDataPage];

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

    self.cateId = [aDecoder decodeDoubleForKey:kCLMDataCateId];
    self.totalPages = [aDecoder decodeDoubleForKey:kCLMDataTotalPages];
    self.pageItems = [aDecoder decodeDoubleForKey:kCLMDataPageItems];
    self.totalItems = [aDecoder decodeDoubleForKey:kCLMDataTotalItems];
    self.lists = [aDecoder decodeObjectForKey:kCLMDataLists];
    self.page = [aDecoder decodeDoubleForKey:kCLMDataPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cateId forKey:kCLMDataCateId];
    [aCoder encodeDouble:_totalPages forKey:kCLMDataTotalPages];
    [aCoder encodeDouble:_pageItems forKey:kCLMDataPageItems];
    [aCoder encodeDouble:_totalItems forKey:kCLMDataTotalItems];
    [aCoder encodeObject:_lists forKey:kCLMDataLists];
    [aCoder encodeDouble:_page forKey:kCLMDataPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLMData *copy = [[CLMData alloc] init];
    
    if (copy) {

        copy.cateId = self.cateId;
        copy.totalPages = self.totalPages;
        copy.pageItems = self.pageItems;
        copy.totalItems = self.totalItems;
        copy.lists = [self.lists copyWithZone:zone];
        copy.page = self.page;
    }
    
    return copy;
}


@end

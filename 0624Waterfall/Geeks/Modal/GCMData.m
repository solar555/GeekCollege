//
//  GCMData.m
//
//  Created by mac  on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "GCMData.h"
#import "GCMList.h"


NSString *const kGCMDataPageItems = @"page_items";
NSString *const kGCMDataList = @"list";
NSString *const kGCMDataPage = @"page";


@interface GCMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GCMData

@synthesize pageItems = _pageItems;
@synthesize list = _list;
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
            self.pageItems = [[self objectOrNilForKey:kGCMDataPageItems fromDictionary:dict] doubleValue];
    NSObject *receivedGCMList = [dict objectForKey:kGCMDataList];
    NSMutableArray *parsedGCMList = [NSMutableArray array];
    if ([receivedGCMList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGCMList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGCMList addObject:[GCMList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGCMList isKindOfClass:[NSDictionary class]]) {
       [parsedGCMList addObject:[GCMList modelObjectWithDictionary:(NSDictionary *)receivedGCMList]];
    }

    self.list = [NSArray arrayWithArray:parsedGCMList];
            self.page = [[self objectOrNilForKey:kGCMDataPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageItems] forKey:kGCMDataPageItems];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kGCMDataList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kGCMDataPage];

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

    self.pageItems = [aDecoder decodeDoubleForKey:kGCMDataPageItems];
    self.list = [aDecoder decodeObjectForKey:kGCMDataList];
    self.page = [aDecoder decodeDoubleForKey:kGCMDataPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pageItems forKey:kGCMDataPageItems];
    [aCoder encodeObject:_list forKey:kGCMDataList];
    [aCoder encodeDouble:_page forKey:kGCMDataPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    GCMData *copy = [[GCMData alloc] init];
    
    if (copy) {

        copy.pageItems = self.pageItems;
        copy.list = [self.list copyWithZone:zone];
        copy.page = self.page;
    }
    
    return copy;
}


@end

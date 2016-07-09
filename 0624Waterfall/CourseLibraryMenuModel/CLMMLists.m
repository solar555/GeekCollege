//
//  CLMMLists.m
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLMMLists.h"
#import "CLMMSub.h"


NSString *const kCLMMListsCateId = @"cate_id";
NSString *const kCLMMListsTitle = @"title";
NSString *const kCLMMListsIcon = @"icon";
NSString *const kCLMMListsLevel = @"level";
NSString *const kCLMMListsSub = @"sub";


@interface CLMMLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLMMLists

@synthesize cateId = _cateId;
@synthesize title = _title;
@synthesize icon = _icon;
@synthesize level = _level;
@synthesize sub = _sub;


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
            self.cateId = [[self objectOrNilForKey:kCLMMListsCateId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kCLMMListsTitle fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kCLMMListsIcon fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kCLMMListsLevel fromDictionary:dict] doubleValue];
    NSObject *receivedCLMMSub = [dict objectForKey:kCLMMListsSub];
    NSMutableArray *parsedCLMMSub = [NSMutableArray array];
    if ([receivedCLMMSub isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCLMMSub) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCLMMSub addObject:[CLMMSub modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCLMMSub isKindOfClass:[NSDictionary class]]) {
       [parsedCLMMSub addObject:[CLMMSub modelObjectWithDictionary:(NSDictionary *)receivedCLMMSub]];
    }

    self.sub = [NSArray arrayWithArray:parsedCLMMSub];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cateId] forKey:kCLMMListsCateId];
    [mutableDict setValue:self.title forKey:kCLMMListsTitle];
    [mutableDict setValue:self.icon forKey:kCLMMListsIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kCLMMListsLevel];
    NSMutableArray *tempArrayForSub = [NSMutableArray array];
    for (NSObject *subArrayObject in self.sub) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSub addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSub addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSub] forKey:kCLMMListsSub];

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

    self.cateId = [aDecoder decodeDoubleForKey:kCLMMListsCateId];
    self.title = [aDecoder decodeObjectForKey:kCLMMListsTitle];
    self.icon = [aDecoder decodeObjectForKey:kCLMMListsIcon];
    self.level = [aDecoder decodeDoubleForKey:kCLMMListsLevel];
    self.sub = [aDecoder decodeObjectForKey:kCLMMListsSub];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cateId forKey:kCLMMListsCateId];
    [aCoder encodeObject:_title forKey:kCLMMListsTitle];
    [aCoder encodeObject:_icon forKey:kCLMMListsIcon];
    [aCoder encodeDouble:_level forKey:kCLMMListsLevel];
    [aCoder encodeObject:_sub forKey:kCLMMListsSub];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLMMLists *copy = [[CLMMLists alloc] init];
    
    if (copy) {

        copy.cateId = self.cateId;
        copy.title = [self.title copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
        copy.level = self.level;
        copy.sub = [self.sub copyWithZone:zone];
    }
    
    return copy;
}


@end

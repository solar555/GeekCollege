//
//  CLMMSub.m
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLMMSub.h"


NSString *const kCLMMSubCateId = @"cate_id";
NSString *const kCLMMSubTitle = @"title";
NSString *const kCLMMSubIcon = @"icon";
NSString *const kCLMMSubLevel = @"level";
NSString *const kCLMMSubSub = @"sub";


@interface CLMMSub ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLMMSub

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
            self.cateId = [[self objectOrNilForKey:kCLMMSubCateId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kCLMMSubTitle fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kCLMMSubIcon fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kCLMMSubLevel fromDictionary:dict] doubleValue];
            self.sub = [self objectOrNilForKey:kCLMMSubSub fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cateId] forKey:kCLMMSubCateId];
    [mutableDict setValue:self.title forKey:kCLMMSubTitle];
    [mutableDict setValue:self.icon forKey:kCLMMSubIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kCLMMSubLevel];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSub] forKey:kCLMMSubSub];

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

    self.cateId = [aDecoder decodeDoubleForKey:kCLMMSubCateId];
    self.title = [aDecoder decodeObjectForKey:kCLMMSubTitle];
    self.icon = [aDecoder decodeObjectForKey:kCLMMSubIcon];
    self.level = [aDecoder decodeDoubleForKey:kCLMMSubLevel];
    self.sub = [aDecoder decodeObjectForKey:kCLMMSubSub];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cateId forKey:kCLMMSubCateId];
    [aCoder encodeObject:_title forKey:kCLMMSubTitle];
    [aCoder encodeObject:_icon forKey:kCLMMSubIcon];
    [aCoder encodeDouble:_level forKey:kCLMMSubLevel];
    [aCoder encodeObject:_sub forKey:kCLMMSubSub];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLMMSub *copy = [[CLMMSub alloc] init];
    
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

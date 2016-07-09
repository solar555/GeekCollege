//
//  BMLists.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BMLists.h"


NSString *const kBMListsTitle = @"title";
NSString *const kBMListsJump = @"jump";
NSString *const kBMListsImage = @"image";
NSString *const kBMListsJumpType = @"jump_type";


@interface BMLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BMLists

@synthesize title = _title;
@synthesize jump = _jump;
@synthesize image = _image;
@synthesize jumpType = _jumpType;


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
            self.title = [self objectOrNilForKey:kBMListsTitle fromDictionary:dict];
            self.jump = [self objectOrNilForKey:kBMListsJump fromDictionary:dict];
            self.image = [self objectOrNilForKey:kBMListsImage fromDictionary:dict];
            self.jumpType = [[self objectOrNilForKey:kBMListsJumpType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kBMListsTitle];
    [mutableDict setValue:self.jump forKey:kBMListsJump];
    [mutableDict setValue:self.image forKey:kBMListsImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.jumpType] forKey:kBMListsJumpType];

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

    self.title = [aDecoder decodeObjectForKey:kBMListsTitle];
    self.jump = [aDecoder decodeObjectForKey:kBMListsJump];
    self.image = [aDecoder decodeObjectForKey:kBMListsImage];
    self.jumpType = [aDecoder decodeDoubleForKey:kBMListsJumpType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kBMListsTitle];
    [aCoder encodeObject:_jump forKey:kBMListsJump];
    [aCoder encodeObject:_image forKey:kBMListsImage];
    [aCoder encodeDouble:_jumpType forKey:kBMListsJumpType];
}

- (id)copyWithZone:(NSZone *)zone
{
    BMLists *copy = [[BMLists alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.jump = [self.jump copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.jumpType = self.jumpType;
    }
    
    return copy;
}


@end

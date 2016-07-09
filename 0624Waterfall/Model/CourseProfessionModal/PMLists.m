//
//  PMLists.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PMLists.h"


NSString *const kPMListsStatus = @"status";
NSString *const kPMListsCateId = @"cate_id";
NSString *const kPMListsSlug = @"slug";
NSString *const kPMListsIndexImage = @"index_image";
NSString *const kPMListsIndexDesc2 = @"index_desc2";
NSString *const kPMListsShortDesc = @"short_desc";
NSString *const kPMListsDescription = @"description";
NSString *const kPMListsName = @"name";
NSString *const kPMListsIndexDesc1 = @"index_desc1";


@interface PMLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PMLists

@synthesize status = _status;
@synthesize cateId = _cateId;
@synthesize slug = _slug;
@synthesize indexImage = _indexImage;
@synthesize indexDesc2 = _indexDesc2;
@synthesize shortDesc = _shortDesc;
@synthesize listsDescription = _listsDescription;
@synthesize name = _name;
@synthesize indexDesc1 = _indexDesc1;


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
            self.status = [self objectOrNilForKey:kPMListsStatus fromDictionary:dict];
            self.cateId = [[self objectOrNilForKey:kPMListsCateId fromDictionary:dict] doubleValue];
            self.slug = [self objectOrNilForKey:kPMListsSlug fromDictionary:dict];
            self.indexImage = [self objectOrNilForKey:kPMListsIndexImage fromDictionary:dict];
            self.indexDesc2 = [self objectOrNilForKey:kPMListsIndexDesc2 fromDictionary:dict];
            self.shortDesc = [self objectOrNilForKey:kPMListsShortDesc fromDictionary:dict];
            self.listsDescription = [self objectOrNilForKey:kPMListsDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kPMListsName fromDictionary:dict];
            self.indexDesc1 = [self objectOrNilForKey:kPMListsIndexDesc1 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kPMListsStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cateId] forKey:kPMListsCateId];
    [mutableDict setValue:self.slug forKey:kPMListsSlug];
    [mutableDict setValue:self.indexImage forKey:kPMListsIndexImage];
    [mutableDict setValue:self.indexDesc2 forKey:kPMListsIndexDesc2];
    [mutableDict setValue:self.shortDesc forKey:kPMListsShortDesc];
    [mutableDict setValue:self.listsDescription forKey:kPMListsDescription];
    [mutableDict setValue:self.name forKey:kPMListsName];
    [mutableDict setValue:self.indexDesc1 forKey:kPMListsIndexDesc1];

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

    self.status = [aDecoder decodeObjectForKey:kPMListsStatus];
    self.cateId = [aDecoder decodeDoubleForKey:kPMListsCateId];
    self.slug = [aDecoder decodeObjectForKey:kPMListsSlug];
    self.indexImage = [aDecoder decodeObjectForKey:kPMListsIndexImage];
    self.indexDesc2 = [aDecoder decodeObjectForKey:kPMListsIndexDesc2];
    self.shortDesc = [aDecoder decodeObjectForKey:kPMListsShortDesc];
    self.listsDescription = [aDecoder decodeObjectForKey:kPMListsDescription];
    self.name = [aDecoder decodeObjectForKey:kPMListsName];
    self.indexDesc1 = [aDecoder decodeObjectForKey:kPMListsIndexDesc1];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kPMListsStatus];
    [aCoder encodeDouble:_cateId forKey:kPMListsCateId];
    [aCoder encodeObject:_slug forKey:kPMListsSlug];
    [aCoder encodeObject:_indexImage forKey:kPMListsIndexImage];
    [aCoder encodeObject:_indexDesc2 forKey:kPMListsIndexDesc2];
    [aCoder encodeObject:_shortDesc forKey:kPMListsShortDesc];
    [aCoder encodeObject:_listsDescription forKey:kPMListsDescription];
    [aCoder encodeObject:_name forKey:kPMListsName];
    [aCoder encodeObject:_indexDesc1 forKey:kPMListsIndexDesc1];
}

- (id)copyWithZone:(NSZone *)zone
{
    PMLists *copy = [[PMLists alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.cateId = self.cateId;
        copy.slug = [self.slug copyWithZone:zone];
        copy.indexImage = [self.indexImage copyWithZone:zone];
        copy.indexDesc2 = [self.indexDesc2 copyWithZone:zone];
        copy.shortDesc = [self.shortDesc copyWithZone:zone];
        copy.listsDescription = [self.listsDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.indexDesc1 = [self.indexDesc1 copyWithZone:zone];
    }
    
    return copy;
}


@end

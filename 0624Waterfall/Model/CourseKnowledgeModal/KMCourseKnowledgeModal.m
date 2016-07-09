//
//  KMCourseKnowledgeModal.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "KMCourseKnowledgeModal.h"
#import "KMData.h"


NSString *const kKMCourseKnowledgeModalMsg = @"msg";
NSString *const kKMCourseKnowledgeModalData = @"data";
NSString *const kKMCourseKnowledgeModalCode = @"code";


@interface KMCourseKnowledgeModal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation KMCourseKnowledgeModal

@synthesize msg = _msg;
@synthesize data = _data;
@synthesize code = _code;


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
            self.msg = [self objectOrNilForKey:kKMCourseKnowledgeModalMsg fromDictionary:dict];
            self.data = [KMData modelObjectWithDictionary:[dict objectForKey:kKMCourseKnowledgeModalData]];
            self.code = [[self objectOrNilForKey:kKMCourseKnowledgeModalCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kKMCourseKnowledgeModalMsg];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kKMCourseKnowledgeModalData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kKMCourseKnowledgeModalCode];

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

    self.msg = [aDecoder decodeObjectForKey:kKMCourseKnowledgeModalMsg];
    self.data = [aDecoder decodeObjectForKey:kKMCourseKnowledgeModalData];
    self.code = [aDecoder decodeDoubleForKey:kKMCourseKnowledgeModalCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kKMCourseKnowledgeModalMsg];
    [aCoder encodeObject:_data forKey:kKMCourseKnowledgeModalData];
    [aCoder encodeDouble:_code forKey:kKMCourseKnowledgeModalCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    KMCourseKnowledgeModal *copy = [[KMCourseKnowledgeModal alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end

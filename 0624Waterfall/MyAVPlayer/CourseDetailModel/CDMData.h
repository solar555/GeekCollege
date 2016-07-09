//
//  CDMData.h
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDMIntro;

@interface CDMData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) CDMIntro *intro;
@property (nonatomic, strong) NSArray *lessons;
@property (nonatomic, strong) NSArray *related;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

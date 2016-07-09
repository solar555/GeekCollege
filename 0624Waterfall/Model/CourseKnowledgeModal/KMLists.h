//
//  KMLists.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface KMLists : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double cateId;
@property (nonatomic, assign) double lessonCount;
@property (nonatomic, assign) double courseVideoLength;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double courseCount;
@property (nonatomic, assign) double courseLearnNum;
@property (nonatomic, strong) NSString *listsDescription;
@property (nonatomic, strong) NSString *icon;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

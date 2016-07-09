//
//  HMLists.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HMLists : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double studyNum;
@property (nonatomic, assign) double lessonCount;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double finishLessionCount;
@property (nonatomic, assign) double time;
@property (nonatomic, strong) NSString *favAt;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double level;
@property (nonatomic, assign) double isFree;
@property (nonatomic, assign) double cid;
@property (nonatomic, strong) NSString *visitAt;
@property (nonatomic, assign) double isFav;
@property (nonatomic, assign) double lastSeq;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

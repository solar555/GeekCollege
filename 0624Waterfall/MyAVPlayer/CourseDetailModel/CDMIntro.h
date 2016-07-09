//
//  CDMIntro.h
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CDMIntro : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double isFav;
@property (nonatomic, strong) NSString *cateId;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) double lastSeq;
@property (nonatomic, assign) double lessonCount;
@property (nonatomic, assign) double favorite;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *courseIntro;
@property (nonatomic, assign) double learnNum;
@property (nonatomic, assign) double isFree;
@property (nonatomic, assign) double cid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

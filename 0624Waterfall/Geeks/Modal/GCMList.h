//
//  GCMList.h
//
//  Created by mac  on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GCMDetail, GCMUserInfo;

@interface GCMList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) GCMDetail *detail;
@property (nonatomic, strong) GCMUserInfo *userInfo;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *infoId;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *feedId;
@property (nonatomic, strong) NSString *objectType;
@property (nonatomic, assign) double commentNum;
@property (nonatomic, assign) double likeNum;
@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, assign) BOOL isLike;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

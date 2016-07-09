//
//  MPData.h
//
//  Created by mac  on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MPRelationInfo;

@interface MPData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *truename;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *position;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) MPRelationInfo *relationInfo;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *uname;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *phoneStatus;
@property (nonatomic, strong) NSString *lifeCity;
@property (nonatomic, strong) NSString *emailStatus;
@property (nonatomic, strong) NSString *email;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

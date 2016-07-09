//
//  MPRelationInfo.h
//
//  Created by mac  on 16/7/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MPRelationInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *objUid;
@property (nonatomic, assign) BOOL isFans;
@property (nonatomic, assign) BOOL isFollow;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  GCMUserInfo.h
//
//  Created by mac  on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GCMUserInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *uname;
@property (nonatomic, strong) NSString *position;
@property (nonatomic, strong) NSString *avatar;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

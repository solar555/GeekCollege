//
//  CLMMLists.h
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CLMMLists : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double cateId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) double level;
@property (nonatomic, strong) NSArray *sub;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

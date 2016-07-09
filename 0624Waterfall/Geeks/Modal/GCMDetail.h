//
//  GCMDetail.h
//
//  Created by mac  on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GCMDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double lessonNum;
@property (nonatomic, strong) NSString *contributor;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) double courseLength;
@property (nonatomic, strong) NSString *learnNum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

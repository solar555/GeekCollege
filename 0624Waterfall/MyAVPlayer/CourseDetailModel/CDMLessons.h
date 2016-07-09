//
//  CDMLessons.h
//
//  Created by mac  on 16/7/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CDMLessons : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *length;
@property (nonatomic, assign) BOOL videoPlay;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) double lessonsIdentifier;
@property (nonatomic, assign) BOOL videoDownload;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double isFinish;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

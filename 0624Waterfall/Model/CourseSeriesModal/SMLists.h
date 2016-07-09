//
//  SMLists.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SMLists : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double collectStatus;
@property (nonatomic, strong) NSString *listsIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *studyCount;
@property (nonatomic, strong) NSString *imageApp;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

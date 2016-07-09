//
//  PMLists.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PMLists : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) double cateId;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *indexImage;
@property (nonatomic, strong) NSString *indexDesc2;
@property (nonatomic, strong) NSString *shortDesc;
@property (nonatomic, strong) NSString *listsDescription;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *indexDesc1;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  CLMData.h
//
//  Created by mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CLMData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double cateId;
@property (nonatomic, assign) double totalPages;
@property (nonatomic, assign) double pageItems;
@property (nonatomic, assign) double totalItems;
@property (nonatomic, strong) NSArray *lists;
@property (nonatomic, assign) double page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

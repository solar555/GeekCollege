//
//  HMData.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HMData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double totalPages;
@property (nonatomic, assign) double pageItems;
@property (nonatomic, assign) double totalItems;
@property (nonatomic, strong) NSArray *lists;
@property (nonatomic, assign) double page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

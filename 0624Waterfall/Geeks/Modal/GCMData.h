//
//  GCMData.h
//
//  Created by mac  on 16/6/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GCMData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double pageItems;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, assign) double page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

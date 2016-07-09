//
//  PayMMonths.h
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PayMMonths : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *activity;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *desc;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

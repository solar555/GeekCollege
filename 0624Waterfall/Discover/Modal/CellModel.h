//
//  CellModel.h
//  0624Waterfall
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PayMPaymentModel.h"
#import "PayMData.h"
#import "PayMVipInfo.h"
#import "PayMYears.h"
#import "PayMMonths.h"

@interface CellModel : NSObject
@property (copy,nonatomic)NSString *cellImageView;
@property (copy,nonatomic)NSString *cellTextLabel;
@property (copy,nonatomic)NSString *cellDetailLabel;
@property (copy,nonatomic)NSString *accessoryImageView;

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)mineViewModelWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)vipViewModelWithModel:(PayMPaymentModel *)paymentModel withCellIndexPathRow:(NSInteger)row;
@end

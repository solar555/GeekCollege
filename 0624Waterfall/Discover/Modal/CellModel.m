//
//  CellModel.m
//  0624Waterfall
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    CellModel *cellModel = [[CellModel alloc]init];
    cellModel.cellImageView = [dictionary objectForKey:@"cellImageView"];
    cellModel.cellTextLabel = [dictionary objectForKey:@"cellTextLabel"];
    return cellModel;
}
+ (instancetype)mineViewModelWithDictionary:(NSDictionary *)dictionary{
    CellModel *cellModel = [[CellModel alloc]init];
    cellModel.cellImageView = [dictionary objectForKey:@"cellImageView"];
    cellModel.cellTextLabel = [dictionary objectForKey:@"cellTextLabel"];
    cellModel.cellDetailLabel = [dictionary objectForKey:@"cellDetailLabel"];
    cellModel.accessoryImageView = @"common_icon_arrow";
    return cellModel;
}
+ (instancetype)vipViewModelWithModel:(PayMPaymentModel *)paymentModel withCellIndexPathRow:(NSInteger)row{
    CellModel *cellModel = [[CellModel alloc]init];
    PayMData *pmData = paymentModel.data;
    PayMVipInfo *pmVipInfo = pmData.vipInfo;
    PayMYears *years = pmVipInfo.years;
    PayMMonths *months = pmVipInfo.months;
    if (row == 0) {
        cellModel.cellTextLabel = [NSString stringWithFormat:@"月度黄金会员%@元",months.price];
        cellModel.cellDetailLabel = months.desc;
        cellModel.accessoryImageView = @"buynosel_16x16_";
    } else if (row == 1) {
        cellModel.cellTextLabel = [NSString stringWithFormat:@"年度黄金会员%@元",years.price];
        cellModel.cellDetailLabel = years.desc;
        cellModel.accessoryImageView = @"buynosel_16x16_";
    }
    return cellModel;
}
@end

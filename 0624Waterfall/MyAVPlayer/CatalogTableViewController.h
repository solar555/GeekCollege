//
//  CatalogTableViewController.h
//  0624Waterfall
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDMData.h"
#import "CDMLessons.h"
#import "CDMIntro.h"
#import "CDMRelated.h"

@interface CatalogTableViewController : UITableViewController

@property(nonatomic,strong)CDMData *dataModel;
@property(nonatomic,strong)CDMLessons *catalogModel;
@property(nonatomic,strong)CDMRelated *relatedModel;

@end

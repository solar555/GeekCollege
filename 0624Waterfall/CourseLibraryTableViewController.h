//
//  CourseLibraryTableViewController.h
//  0624Waterfall
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLMCourseListModel.h"
#import "CLMData.h"
#import "CLMLists.h"

#import "CLMMCourseLibraryMenuModel.h"
#import "CLMMData.h"
#import "CLMMLists.h"
#import "CLMMSub.h"

@interface CourseLibraryTableViewController : UITableViewController
@property(nonatomic,strong)CLMCourseListModel *myModel;
@property(nonatomic,strong)CLMMCourseLibraryMenuModel *myMenuModel;

@end

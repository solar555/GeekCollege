//
//  CourseDetailCollectionViewCell.h
//  0624Waterfall
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 solar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDMData.h"
#import "CDMLessons.h"
#import "CDMIntro.h"
#import "CDMRelated.h"

#import "CatalogTableViewController.h"
#import "CourseDetailWebView.h"
#import "RelatedCourseTableViewController.h"

@interface CourseDetailCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)UILabel *textLabel;
@property(nonatomic,strong)CatalogTableViewController *catalogTableViewController;
@property(nonatomic,strong)CourseDetailWebView *detailsWebView;
@property(nonatomic,strong)UITableView *relateCourseTableView;
@property(nonatomic,strong)RelatedCourseTableViewController *relatedCourseTableViewController;


@property(nonatomic,strong)CDMData *dataModel;
@property(nonatomic,strong)CDMLessons *catalogModel;
@property(nonatomic,strong)CDMIntro *introModel;
@property(nonatomic,strong)CDMRelated *relatedModel;
@property(nonatomic,strong)CDMData *dataModelRelated;


@end

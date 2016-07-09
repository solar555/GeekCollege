//
//  CourseDetailCollectionViewCell.m
//  0624Waterfall
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 solar. All rights reserved.
//

#import "CourseDetailCollectionViewCell.h"

@implementation CourseDetailCollectionViewCell
//- (instancetype)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
//    }
//    return self;
//}
- (void)setDataModel:(CDMData *)dataModel{
    _dataModel = dataModel;
    _catalogTableViewController = [[CatalogTableViewController alloc]init];
    _catalogTableViewController.dataModel = dataModel;
    [self.contentView addSubview:_catalogTableViewController.view];
}
- (void)setIntroModel:(CDMIntro *)introModel{
    _introModel = introModel;
    _detailsWebView = [[CourseDetailWebView alloc]initWithFrame:self.contentView.frame];
    _detailsWebView.introModel = introModel;
    [self.contentView addSubview:_detailsWebView];
    
}
- (void)setDataModelRelated:(CDMData *)dataModelRelated{
    _dataModelRelated = dataModelRelated;
    _relatedCourseTableViewController = [[RelatedCourseTableViewController alloc]init];
    _relatedCourseTableViewController.dataModel = dataModelRelated;
    [self.contentView addSubview:_relatedCourseTableViewController.view];
}
@end











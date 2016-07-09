//
//  SeriesTableViewCell.h
//  
//
//  Created by mac on 16/6/30.
//
//

#import <UIKit/UIKit.h>
#import "SMCourseSeriesModal.h"
#import "SMData.h"
#import "SMLists.h"
#import "ProfessionView.h"

@interface SeriesTableViewCell : UITableViewCell
@property (nonatomic,strong)UIView *headView;

@property (nonatomic,strong)SMCourseSeriesModal *myMadal;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic,strong)NSMutableArray<ProfessionView*> *myCourseViewArray;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end

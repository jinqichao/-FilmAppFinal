//
//  PosterBodyCollectionView.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PosterBodyCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(strong,nonatomic)NSArray *datalist;
@property(strong,nonatomic)NSMutableArray *fortitlename;

@property(strong,nonatomic)NSString *titleName;



@property (nonatomic ,retain) NSArray *dataList;

@property(assign,nonatomic)float edge;
@property(strong,nonatomic)NSIndexPath *selectIndexPath;

@end

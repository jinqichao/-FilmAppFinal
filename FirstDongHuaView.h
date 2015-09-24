//
//  FirstDongHuaView.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstCollectionViewCell.h"
@interface FirstDongHuaView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//数据源
@property(nonatomic,retain) NSMutableArray * dataList;
@end

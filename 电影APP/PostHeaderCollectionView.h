//
//  PostHeaderCollectionView.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostHeaderCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>
//{
//    //左侧单元格填充好的距离
//    float _edge;
//}
@property(assign,nonatomic)float edge;
@property(strong,nonatomic)NSArray *datalist;
@property(strong,nonatomic)NSIndexPath *selectIndexPath;
@end

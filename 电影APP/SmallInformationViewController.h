//
//  SmallInformationViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/20.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"

@interface SmallInformationViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(strong,nonatomic)UICollectionView *collectionview;

//标题
@property(strong,nonatomic)NSString *titleName;

//标题LABEL
@property(strong,nonatomic)UILabel *titleLabel;
//配图
@property(strong,nonatomic)UIImageView *PicImageView;
//图片
@property(strong,nonatomic)NSString *PicStr;


//座位
@property(strong,nonatomic)UILabel *label;
@end

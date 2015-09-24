//
//  XLSCollectionViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"

@interface XLSCollectionViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(strong,nonatomic)UICollectionView *postInformationView;

@property(strong,nonatomic)UIImageView *pictureImage;

//存放图片的数组
@property(strong,nonatomic)NSMutableArray *pictureArray;

@property(strong,nonatomic)NSDictionary *picturedic;


@property(strong,nonatomic)NSString *titlename;
@end

//
//  FirstPicViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/21.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"
#import "XLSCollectionViewController.h"
#import "SrcollViewController.h"
@interface FirstPicViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(strong,nonatomic)UICollectionView *postInformationView;

@property(strong,nonatomic)UIImageView *pictureImage;

//存放图片的数组
@property(strong,nonatomic)NSMutableArray *pictureArray;

@property(strong,nonatomic)NSDictionary *picturedic;


@property(strong,nonatomic)NSString *titlename;

@property(assign,nonatomic)BOOL isBigLayout;
@property(strong,nonatomic)UICollectionViewFlowLayout *flowout;
@property(strong,nonatomic)UICollectionViewFlowLayout *flowbig;

@end

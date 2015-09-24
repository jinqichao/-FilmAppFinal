//
//  TopViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"
#import "WXRatingView.h"
#import "MovieModel.h"
@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
//主控件
@property(strong,nonatomic)UICollectionView *Topcollection;
//图像
@property(strong,nonatomic)UIImageView *picimageview;
//自定义控件
@property(strong,nonatomic)WXRatingView *wxratingview;
//得分
@property(strong,nonatomic)NSDictionary *ScoreDic;
//图片
@property(strong,nonatomic)NSDictionary *picDic;

//标题
@property(strong,nonatomic)NSArray *titiledic;
@end

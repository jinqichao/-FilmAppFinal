//
//  FilmInforViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/19.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"
#import "WXRatingView.h"
@interface FilmInforViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
//配图
@property(strong,nonatomic)UIImageView *imagelogo;
//标题
@property(strong,nonatomic)UILabel *namelabel;
//ID
@property(strong,nonatomic)UILabel *IDlabel;
//等级
@property(strong,nonatomic)WXRatingView *wxratingview;
//亮点
@property(strong,nonatomic)UILabel *HighLight;

@property(strong,nonatomic)NSDictionary *FilmDic;


@property(strong,nonatomic)UITableView *tableview;

@property(strong,nonatomic)NSMutableDictionary *picDic;

@property(strong,nonatomic)NSMutableArray *picArray;

@property(strong,nonatomic)NSMutableArray *picArray2;
@end

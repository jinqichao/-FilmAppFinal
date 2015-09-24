//
//  FilmAreaViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/19.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"
#import "WXRatingView.h"
@interface FilmAreaViewController : BaseViewController
//价格
@property(strong,nonatomic)UILabel *lowPricelabel;

//评分
@property(strong,nonatomic)WXRatingView *wxratingview;
@property(assign,nonatomic)int wxScroe;
//评分名
@property(strong,nonatomic)UILabel *gradeLabel;
//电话
@property(strong,nonatomic)UILabel *TelephoneLabel;
@property(strong,nonatomic)NSString *telePhone;
//编号
@property(strong,nonatomic)UILabel *IdLabel;
@property(strong,nonatomic)NSString *IDforFilm;
//影院街道
@property(strong,nonatomic)UILabel *CircleName;
@property(strong,nonatomic)NSString *Circle;


//名字
@property(strong,nonatomic)NSString *FilmName;
//最低价
@property(assign,nonatomic)float LowPrice;
//买票
@property(strong,nonatomic)UIButton *FilmButton;

@end

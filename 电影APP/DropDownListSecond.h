//
//  DropDownListSecond.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/19.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropDownListSecond : UIView<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tv;//下拉列表
    NSMutableArray *tableArray;//下拉列表数据
    BOOL showList;//是否弹出下拉列表
    CGFloat tabheight;//table下拉列表的高度
    CGFloat frameHeight;//frame的高度
    
}


@property(strong,nonatomic)UIButton *FileArea;
//城市图片
@property(strong,nonatomic)UIImageView *CityImage;

@property(strong,nonatomic)NSMutableSet *TotleSet;
//获取JSON数据
@property(strong,nonatomic)NSDictionary *FileNameDic;


//判断是否跳转
@property(assign,nonatomic)int indexpath1;

//标题
@property(strong,nonatomic)NSString *TitleForFilm;
//最低价格
@property(assign,nonatomic)float LowPrice;
//电话
@property(strong,nonatomic)NSString *telePhone;
//得分
@property(assign,nonatomic)float ScoreNum;
//编号
@property(strong,nonatomic)NSString *IDforFilm;
//街道
@property(strong,nonatomic)NSString *Street;

@property(strong,nonatomic)NSMutableArray *AllArray;

@end

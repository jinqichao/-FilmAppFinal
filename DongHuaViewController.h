//
//  DongHuaViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "FirstDongHuaView.h"
@interface DongHuaViewController : UIViewController
{
    FirstDongHuaView * _donghuaView;
    NSTimer * _timer;
    
}
//运动的下标数组
@property(nonatomic,retain) NSMutableArray * array;

//数据源
@property(nonatomic,retain) NSMutableArray * dataList;

@property(nonatomic,assign) NSInteger indexNum;
@end

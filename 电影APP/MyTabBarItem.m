//
//  MyTabBarItem.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "MyTabBarItem.h"

@implementation MyTabBarItem
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        
        
    //创建子视图和图片视图
        _myTitleImageView=[[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-22)/2.0, 7, 22, 20)];
        _myTitleImageView.contentMode=UIViewContentModeScaleAspectFit;
        [self addSubview:_myTitleImageView];
        //创建文本
        _myTitlelabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 28, self.frame.size.width, 20)];
        _myTitlelabel.font=[UIFont systemFontOfSize:10];
        _myTitlelabel.textColor=[UIColor whiteColor];
        _myTitlelabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_myTitlelabel];
    }
    return self;
}
-(void)setTitleName:(NSString *)titleName
{
    if (_titleName!=titleName)
    {
        [_titleName release];
        _titleName=[titleName copy];
        _myTitlelabel.text=_titleName;
    }
}
-(void)setImageName:(NSString *)imageName
{
    if (_imageName!=imageName)
    {
        [_imageName release];
        _imageName=[imageName copy];
        _myTitleImageView.image=[UIImage imageNamed:_imageName];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

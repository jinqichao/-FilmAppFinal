//
//  PosterBodyCell.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "PosterBodyCell.h"
#import "WXDataSerivce.h"
@implementation PosterBodyCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    

        
        _baseView=[[UIView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_baseView];
        //创建图片视图
        _imageview=[[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_imageview];
        
        _imageview=[[UIImageView alloc]initWithFrame:CGRectZero];
        [_baseView addSubview:_imageview];
        
        //创建电影详情视图
        _detalView=[[UIView alloc]initWithFrame:CGRectZero];
        _detalView.backgroundColor=[UIColor orangeColor];
        [_baseView insertSubview:_detalView atIndex:0];
        
        
        //添加点击事件
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        [_baseView addGestureRecognizer:tap];
        [tap release];
        
        //创建电脑详情的子视图
        _dImageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        [_detalView addSubview:_dImageView];
        
        _titlelabel=[[UILabel alloc]initWithFrame:CGRectZero];
        [_detalView addSubview:_titlelabel];
        
        _originallabel=[[UILabel alloc]initWithFrame:CGRectZero];
        [_detalView addSubview:_originallabel];
    
        _yearlabel=[[UILabel alloc]initWithFrame:CGRectZero];
        [_detalView addSubview:_yearlabel];
        
        _yearname=[[UILabel alloc]initWithFrame:CGRectZero];
        [_detalView addSubview:_yearname];
        _wxratingview=[[WXRatingView alloc]initWithFrame:CGRectMake(20, 160, 200, 40)];
        [_detalView addSubview:_wxratingview];
        //设置背景颜色
        self.backgroundColor=[UIColor grayColor];
        self.backgroundView=nil;
      
    }
    return self;
}
/*
 在layoutSubviews 做两件事：
 1.设置视图位置
 2.设置视图尺寸
 // 在UICollectionViewCell里面系统不会自动的调用layoutSubviews方法，要手动的调用
 相当于重写父类的方法
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    //重置单元格坐标系统
    _baseView.transform=CGAffineTransformIdentity;
    
    
    //设置图片的大小和尺寸
    _baseView.frame=CGRectMake(10, 0, self.width-20, self.height);
    _imageview.frame=_baseView.bounds;
    NSURL *imageurl=[NSURL URLWithString:self.model.image_large];
    [_imageview sd_setImageWithURL:imageurl];
    
    
    
    
    //设置电脑详情视图的大小和内容
    _detalView.frame=_imageview.bounds;
    //设置电影详情子视图
    //图片
    
    _dImageView.frame=CGRectMake(20, 40, 60, 90);
    [_dImageView sd_setImageWithURL:[NSURL URLWithString:self.model.image_medium]];
    
    
    
    
    _titlelabel.frame=CGRectMake(90, 35, 100, 40);
    _titlelabel.text=self.datadic[@"subject"][@"title"];
    _titlelabel.textColor=[UIColor blackColor];
    _yearlabel.frame=CGRectMake(105, 130, 100,40);
    _yearlabel.textColor=[UIColor whiteColor];
    _yearlabel.text=self.datadic[@"subject"][@"year"];
    _originallabel.frame=CGRectMake(90, 100, 200, 40);
    _originallabel.text=self.datadic[@"subject"][@"original_title"];
    _originallabel.textColor=[UIColor grayColor];
    _yearname.text=@"首映年份";
    _yearname.frame=CGRectMake(20, 130, 100, 40);
    
//    _wxratingview.frame=CGRectMake(140, 95, 200, 40);
    _wxratingview.scoreNum=[self.datadic[@"subject"][@"rating"][@"average"] floatValue];
    
}

-(void)tapAction{
    
    self.PicBool=!self.PicBool;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.35];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_baseView cache:YES];
    [_baseView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView commitAnimations];
    
}
@end

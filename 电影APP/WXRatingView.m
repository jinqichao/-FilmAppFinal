//
//  WXRatingView.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "WXRatingView.h"
#define star_width 35
#define star_height 34
@implementation WXRatingView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建子视图
        [self _initViews];
    }
    return self;
}
/**
 *  创建子视图
 */
-(void)_initViews
{
    //创建灰色星星视图
    _grayView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, star_width*5, star_height)];
    //设置背景图片
    _grayView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"gray.png"]];
    float scale=(self.height/2.0)/star_height;
    //设置图片大小
    _grayView.transform=CGAffineTransformMakeScale(scale, scale);
    _grayView.left=0;
    _grayView.top=self.height* .25;
    [self addSubview:_grayView];
    
    
    //创建黄色星星视图
    _yellowView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, star_width*5, star_height)];
    _yellowView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow.png"]];
    _yellowView.transform=CGAffineTransformMakeScale(scale, scale);
    _yellowView.left=0;
    _yellowView.top=self.height *.25;
    [self addSubview:_yellowView];
    
    
    //创建分数文本视图
    _scoreLabel=[[UILabel alloc]initWithFrame:CGRectMake(_grayView.right+10, 0, 50, self.height)];
    _scoreLabel.textColor=[UIColor greenColor];
    
    _scoreLabel.font=[UIFont boldSystemFontOfSize:self.height *.5];
    [self addSubview:_scoreLabel];
    
    
    
}
-(void)setScoreNum:(float)scoreNum
{
    if (_scoreNum!=scoreNum)
    {
        _scoreNum=scoreNum;
        //改变黄色星星宽度
        _yellowView.width= _grayView.width *scoreNum * .1;
        _scoreLabel.text=[NSString stringWithFormat:@"%.1f",_scoreNum];
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

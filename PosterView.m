//
//  PosterView.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "PosterView.h"
#import "MovieModel.h"
@implementation PosterView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        //初始化子视图
        [self _initViews];
        
        //创建头视图和内容中心视图的单元格
        [_headerCollectionView addObserver:self forKeyPath:@"selectIndexPath" options:NSKeyValueObservingOptionNew context:nil];
        [_bodyCollectionView addObserver:self forKeyPath:@"selectIndexPath" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
//创建子视图
-(void)_initViews
{
    //海报内容视图
    [self _initBodyView];
    [self _initTitleBottomView];
    //创建头视图
    //
    [self _initLightView];
    //
    [self _initMaskView];
    //
     [self _initHeaderView];
    //    6给海报视图添加轻扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    //    配置轻扫方向
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];

}
//创建头视图
- (void)_initHeaderView
{
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -100, kScreenWidth, 126)];
    // 设置图片
    _headerView.userInteractionEnabled=YES;
    UIImage *image = [UIImage imageNamed:@"indexBG_home.png"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:4];
    _headerView.image = image;
    [self addSubview:_headerView];
    
    //创建海报子视图
    _headerCollectionView=[[PostHeaderCollectionView alloc]initWithFrame:CGRectMake(0, 10, kScreenWidth, 90)];
    [_headerView addSubview:_headerCollectionView];
    
    //创建按钮
    
    UIButton *headerButton=[UIButton buttonWithType:UIButtonTypeCustom];
    headerButton.tag=1;
    headerButton.frame=CGRectMake((kScreenWidth-26)/2.0+2, 100, 26, 26);
    
    //设置图片
    [headerButton setImage:[UIImage imageNamed:@"down_home.png"] forState:UIControlStateNormal];
    
    //添加事件
    [headerButton addTarget:self action:@selector(headerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:headerButton];
    
}
//创建遮罩视图
-(void)_initMaskView
{
    _maskView=[[UIView alloc]initWithFrame:self.bounds];
    _maskView.backgroundColor=[UIColor blackColor];
    _maskView.alpha=.0;
    [self addSubview:_maskView];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [_maskView addGestureRecognizer:tap];
    
    [tap release];
}
//创建灯光视图
-(void)_initLightView
{
    //左侧灯光
    _leftLightImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 20,124, 204)];
    _leftLightImageView.image=[UIImage imageNamed:@"light"];
    [self addSubview:_leftLightImageView];
    
    //右侧灯光
    _rightLightImageView =[[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 124, 204)];
    _rightLightImageView.image=[UIImage imageNamed:@"light"];
    _rightLightImageView.right=kScreenWidth-20;
    [self addSubview:_rightLightImageView];
}
//标题视图
-(void)_initTitleBottomView
{
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, self.height-35, kScreenWidth, 35)];
    _titleLabel.text=@"双枪";
    
    _titleLabel.textColor=[UIColor redColor];
    _titleLabel.textAlignment=NSTextAlignmentCenter;
    _titleLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    [self addSubview:_titleLabel];
}

//海报内容视图
-(void)_initBodyView
{
    _bodyCollectionView=[[PosterBodyCollectionView alloc]initWithFrame:CGRectMake(0,50, kScreenWidth, self.height-100)];
    [self addSubview:_bodyCollectionView];
}
-(void)setDataList:(NSArray *)dataList
{
    if (_dataList!=dataList)
    {
        [_dataList release];
        _dataList=[dataList retain];
        
        //拿到数据马上显示
        _bodyCollectionView.datalist=_dataList;
        //刷新视图
        [_bodyCollectionView reloadData];
        
        _headerCollectionView.datalist=_dataList;
        [_headerCollectionView reloadData];
        
    }
}

//头视图按钮点击事件
-(void)headerButtonAction:(UIButton *)button
{
    //创建属性动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.35];
    //设置动画结束调用的方法
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop)];
    
    
    if (_headerView.top==0)
    {
        _headerView.top=-100;
        _maskView.alpha=.0;
    }
    else
    {
        _headerView.top=0;
        _maskView.alpha=.5;
    }
    [UIView commitAnimations];
    
    
}
-(void)tapAction:(UITapGestureRecognizer *)tap
{
    //手动让按钮执行点击事件
    UIButton *headButton=(UIButton *)[_headerView viewWithTag:1];
    
    [headButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}
-(void)animationDidStop
{
    //获取按钮
    UIButton *headerButton=(UIButton *)[_headerView viewWithTag:1];
    
    if (_headerView.top==0)
    {
        headerButton.imageView.transform=CGAffineTransformMakeRotation(M_PI);
    }
    else
    {
        headerButton.imageView.transform=CGAffineTransformIdentity;
    }
}
//下拉手势
-(void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    UIButton *headButton=(UIButton *)[_headerView viewWithTag:1];
    
    [headButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}
//KVO设置同步
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _headerCollectionView)
    {
        //当前头视图中心单元格位置
        NSIndexPath *indexPath=change[@"new"];
        //让内容的单元格与头视图的单元格一致
      
            if (indexPath.row!=_bodyCollectionView.selectIndexPath.row)
            {
                //让头视图单元格滑动到指定位置
                float x=indexPath.row*(kScreenWidth *.7)-_bodyCollectionView.edge;
                [_bodyCollectionView setContentOffset:CGPointMake(x, 0) animated:YES];
                //记录当前单元格索引
                _bodyCollectionView.selectIndexPath=indexPath;
            }
       
    }
    else
    {
        //获取当前内容单元格的选中位置
        NSIndexPath *indexpath=change[@"new"];
        //和头视图的单元格中心进行比较
       
            if (indexpath.row!=_headerCollectionView.selectIndexPath.row)
            {
                //让头视图的单元格滑动到指定位置
                float x=indexpath.row * 70-_headerCollectionView.edge;
                [_headerCollectionView setContentOffset:CGPointMake(x, 0) animated:YES];
                
                //头视图记录单元格的中心位置
                _headerCollectionView.selectIndexPath=indexpath;
            }
      
      }
    

   
    
    
    //设置标题内容
    NSIndexPath *indexpath=change[@"new"];
    MovieModel *model=self.dataList[indexpath.row];
    _titleLabel.text=model.title;
    _titleLabel.textColor=[UIColor redColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

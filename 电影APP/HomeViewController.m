//
//  HomeViewController.m
//  电影APP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "HomeViewController.h"
#import "MovieModel.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置标题
    self.title=@"首页";
    
    //创建子视图
    [self _initViews];
    //创建右侧导航按钮

    [self _initRightBarButtonItem];

    //加载数据
    [self _loadData];
    //创建按钮打开小视图


}

-(void)_loadData
{
    //获取电影列表数据
    NSDictionary *result=[WXDataSerivce getJSONDataWithFileName:@"us_box"];
    NSArray *subjects=result[@"subjects"];
    _listTableView.dataList=subjects;
    _posterbodycollectionview.dataList=subjects;
//    NSLog(@"%@",_posterbodycollectionview.dataList);
    
    //刷新列表视图
    [_listTableView reloadData];
    
    //把数据传给海报
    //使用数据模型对象整理数据，创建可变数组存放数据
    NSMutableArray *models=[[NSMutableArray alloc]init];
    //遍历数据
    for (NSDictionary *dic in subjects)
    {
        //通过电影信息字典创建数据模型对象
        MovieModel *model=[[MovieModel alloc]initwithContentOfDic:dic];
        [models addObject:model];
        [model release];
    }
    //将数据传给海报视图对象
    _posterView.dataList=models;
    [models release];
}
//创建子视图
-(void)_initViews
{
    //创建列表视图
    _listTableView=[[ListTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49) style:UITableViewStylePlain];
    [self.view addSubview:_listTableView];
    //创建海报视图
    _posterView=[[PosterView alloc]initWithFrame:_listTableView.bounds];
    _posterView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_posterView];
}
-(void)_initRightBarButtonItem
{
    UIView *rightButtonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 49, 25)];
    //创建海报按钮
    UIButton *posterButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    posterButton.frame=rightButtonView.bounds;
    //创建标题图片
    
    [posterButton setImage:[UIImage imageNamed:@"poster_home.png"] forState:UIControlStateNormal];
    //创建背景图片
    [posterButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x.png"] forState:UIControlStateNormal];
    //添加事件
    [posterButton addTarget:self action:@selector(postButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //按钮添加到右侧按钮视图上
    [rightButtonView addSubview:posterButton];
    //创建列表按钮
    UIButton *listbutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    listbutton.frame=rightButtonView.bounds;
    //设置标题图片
    
    
    
    UIImage *image1=[UIImage imageNamed:@"list_home.png"];
    image1=[image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [listbutton setImage:image1 forState:UIControlStateNormal];
     //设置背景图片
     [listbutton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x.png"] forState:UIControlStateNormal];
    //添加事件
    [listbutton addTarget:self action:@selector(listButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightButtonView addSubview:listbutton];
    //创建导航按钮
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButtonView];
    self.navigationItem.rightBarButtonItem=rightItem;
    [rightItem release];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)postButtonAction:(UIButton *)button
{
    // 切换按钮的动画
    [self exChangedSubviewAnimationWithSuperView:button.superview isFromLeft:NO];
    // 切换海报视图
    [self exChangedSubviewAnimationWithSuperView:self.view isFromLeft:NO];
}
-(void)listButtonAction:(UIButton *)button
{
    [self exChangedSubviewAnimationWithSuperView:button.superview isFromLeft:NO];
    [self exChangedSubviewAnimationWithSuperView:self.view isFromLeft:NO];
}
-(void)exChangedSubviewAnimationWithSuperView:(UIView *)superview isFromLeft:(BOOL)fromLeft

{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.35];
    //    切换当前视图的子视图
    [UIView setAnimationTransition:fromLeft ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight forView:superview cache:YES];
    // 切换当前视图的子视图索引位置
    [superview exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    [UIView commitAnimations];
    
    
}
/*
#pragma mark - Navigation

 In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     Get the new view controller using [segue destinationViewController].
     Pass the selected object to the new view controller.
}
*/

@end

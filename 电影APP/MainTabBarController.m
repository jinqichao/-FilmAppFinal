//
//  MainTabBarController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "TopViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "BaseNavigationController.h"
#import "MyTabBarItem.h"
#import "NewViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initSbuViewControllers];
    [self _customTabBar];
}
-(void)_customTabBar
{
    for (UIView *subView in self.tabBar.subviews)
    {
        [subView removeFromSuperview];
    }
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all.png"]];
    // 创建选中的图片
    _selectedImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 42, 42)];
    _selectedImageView.image=[UIImage imageNamed:@"selectTabbar_bg_all1@2x.png"];
    [self.tabBar addSubview:_selectedImageView];
    
    //创建标签栏按钮
    NSArray *imageNames=@[@"list_home.png",@"msg_new.png",@"start_top250.png",@"icon_cinema.png",@"more_select_setting.png"];
    NSArray *titles=@[@"首页",@"新闻",@"TOP",@"影院",@"更多"];
    //创建按钮
    float button_width=kScreenWidth/imageNames.count;
    for (int i=0; i<imageNames.count; i++)
    {
        MyTabBarItem *item=[[MyTabBarItem alloc]initWithFrame:CGRectMake(i*button_width, 0, button_width, 49)];
        //设置TAG
        item.tag=i;
        //设置标题
        item.titleName=titles[i];
        //设置图片
        item.imageName=imageNames[i];
        //添加事件
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:item];
        //如果是第一个按钮
        if (i==0)
        {
            _selectedImageView.center=item.center;
        }
        [item release];
    }
    
}
//创建子视图控制器
-(void)_initSbuViewControllers
{
    //创建首页
    HomeViewController *homeVC=[[HomeViewController alloc]init];
    //创建新闻
    NewViewController *newVC=[[NewViewController alloc]init];
    //创建TOP
    TopViewController *topVC=[[TopViewController alloc]init];
    //创建影院
    CinemaViewController *cinemaVC=[[CinemaViewController alloc]init];
    //创建更多
    MoreViewController *moreVc=[[MoreViewController alloc]init];
    //将视图控制器放入到数组中
    NSArray *viewControllers=@[homeVC,newVC,topVC,cinemaVC,moreVc];
    NSMutableArray *baseNavs=[[NSMutableArray alloc]init];
    for (UIViewController *viewController in viewControllers)
    {
        //创建导航控制器
        BaseNavigationController *baseNav=[[BaseNavigationController alloc]initWithRootViewController:viewController];
        //添加
        [baseNavs addObject:baseNav];
        //释放
        [baseNav release];
    }
    self.viewControllers=baseNavs;
    [homeVC release];
    [newVC release];
    [topVC release];
    [cinemaVC release];
    [moreVc release];
    [baseNavs release];
}
-(void)itemAction:(UIButton *)item
{
    self.selectedIndex=item.tag;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.22];
    _selectedImageView.center=item.center;
    [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

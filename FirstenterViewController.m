//
//  FirstenterViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "FirstenterViewController.h"
#import "DongHuaViewController.h"
@interface FirstenterViewController ()

@end

@implementation FirstenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置滑块基本属性
    self.mainScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.mainScrollView.contentSize=CGSizeMake(WIDTH*5, HEIGHT-100);
    self.mainScrollView.showsHorizontalScrollIndicator=NO;
    self.mainScrollView.showsVerticalScrollIndicator=NO;
    self.mainScrollView.alwaysBounceVertical=NO;
    self.mainScrollView.delegate=self;
    self.mainScrollView.pagingEnabled=YES;
    //添加图片
    UIImageView *image1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    image1.image=[UIImage imageNamed:@"guide1"];
    UIImageView *image11=[[UIImageView alloc]initWithFrame:CGRectMake(140, 585, 100, 20)];
    image11.image=[UIImage imageNamed:@"guideProgress1"];
    UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    image2.image=[UIImage imageNamed:@"guide2"];
     UIImageView *image22=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH+140, 585, 100, 20)];
    image22.image=[UIImage imageNamed:@"guideProgress2"];
    UIImageView *image3=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*2, 0, WIDTH, HEIGHT)];
    image3.image=[UIImage imageNamed:@"guide3"];
     UIImageView *image33=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*2+140, 585, 100, 20)];
    image33.image=[UIImage imageNamed:@"guideProgress3"];
    UIImageView *image4=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*3, 0, WIDTH, HEIGHT)];
    image4.image=[UIImage imageNamed:@"guide4"];
    UIImageView *image44=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*3+140, 585, 100, 20)];
    image44.image=[UIImage imageNamed:@"guideProgress4"];
    UIImageView *image5=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*4, 0, WIDTH, HEIGHT)];
     UIImageView *image55=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*4+140, 585, 100, 20)];
    image55.image=[UIImage imageNamed:@"guideProgress5"];
    image5.image=[UIImage imageNamed:@"guide5"];
    //添加跳转按钮
    self.skipbutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.skipbutton setFrame:CGRectMake(WIDTH*4+140, 515, 100, 40)];
    [self.skipbutton setTitle:@"前往影院" forState:UIControlStateNormal];
    self.skipbutton.titleLabel.font=[UIFont systemFontOfSize:20];
    [self.skipbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self. skipbutton addTarget:self action:@selector(skiptomain) forControlEvents:UIControlEventTouchUpInside];
    //向控件中添加视图
    [self.mainScrollView addSubview:image1];
    [self.mainScrollView addSubview:image2];
    [self.mainScrollView addSubview:image3];
    [self.mainScrollView addSubview:image4];
    [self.mainScrollView addSubview:image5];
     [self.mainScrollView addSubview:image11];
     [self.mainScrollView addSubview:image22];
     [self.mainScrollView addSubview:image33];
     [self.mainScrollView addSubview:image44];
     [self.mainScrollView addSubview:image55];
    [self.mainScrollView addSubview:self.skipbutton];
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView release];
}
-(void)skiptomain
{
//    MainTabBarController *main=[[MainTabBarController alloc]init];
//    [self.navigationController pushViewController:main animated:YES];
//    [main release];
    DongHuaViewController *dong=[[DongHuaViewController alloc]init];
    [self.navigationController pushViewController:dong animated:YES];
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

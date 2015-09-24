//
//  CinemaViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "CinemaViewController.h"
#import "FilmInforViewController.h"
#import "FilmAreaViewController.h"
#import "FirstPicViewController.h"
@interface CinemaViewController ()

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    self.view.alpha=0.85;
    
        self.title=@"影院";
    //对控件进行初始化
   _dropDownList=[[DropDownList alloc]initWithFrame:CGRectMake(10, 10,240, 250)];
    [self.view addSubview:_dropDownList];
    
   
    _dropDownListSecond=[[DropDownListSecond alloc]initWithFrame:CGRectMake(10, 270, 340, 250)];
    [self.view addSubview:_dropDownListSecond];
    //图像
    self.complaints=[[UIImageView alloc]initWithFrame:CGRectMake(260, 30, 100, 70)];
    self.complaints.image=[UIImage imageNamed:@"我要看电影.png"];
    self.complaints.alpha=0.8;
    [self.view addSubview:self.complaints];
    //标签
    self.complaintlabel=[[UILabel alloc]initWithFrame:CGRectMake(280, 30, 100, 70)];
    self.complaintlabel.text=@"看电影";
    self.complaintlabel.textColor=[UIColor yellowColor];
    [self.view addSubview:self.complaintlabel];
    //添加手势
    UITapGestureRecognizer *uitap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(skiptofilm)];
    [self.complaints addGestureRecognizer:uitap];
    self.complaints.userInteractionEnabled=YES;
    
    
    //图像
    self.talk=[[UIImageView alloc]initWithFrame:CGRectMake(260, 110, 100, 70)];
    self.talk.image=[UIImage imageNamed:@"我要咨询.png"];
    self.talk.alpha=0.9;
    [self.view addSubview:self.talk];
    //标签
    self.talklabel=[[UILabel alloc]initWithFrame:CGRectMake(270, 145, 100, 70)];
    self.talklabel.text=@"咨询详情";
    
    self.talklabel.textColor=[UIColor grayColor];
    [self.view addSubview:self.talklabel];
    
    //图像
    self.LookFilm=[[UIImageView alloc]initWithFrame:CGRectMake(260, 195, 100, 70)];
    self.LookFilm.image=[UIImage imageNamed:@"我要投诉"];
    [self.view addSubview:self.LookFilm];
    self.lookFilmLabel=[[UILabel alloc]initWithFrame:CGRectMake(285, 240, 100, 70)];
    self.lookFilmLabel.text=@"投诉";
    self.lookFilmLabel.textColor=[UIColor redColor];
    [self.view addSubview:self.lookFilmLabel];
    
    //添加手势
    UITapGestureRecognizer *uitap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(skiptoArea)];
    [self.LookFilm addGestureRecognizer:uitap2];
    self.LookFilm.userInteractionEnabled=YES;
    //添加观察者
    [_dropDownList addObserver:self forKeyPath:@"indexpath1" options:NSKeyValueObservingOptionNew context:nil];
    [_dropDownListSecond addObserver:self forKeyPath:@"indexpath1" options:NSKeyValueObservingOptionNew context:nil];
    [_dropDownList release];
    
}

//跳转
-(void)skiptoArea
  {
//      FilmAreaViewController *area=[[FilmAreaViewController alloc]init];
//      [self.navigationController pushViewController:area animated:YES];
      FirstPicViewController *pic=[[FirstPicViewController alloc]init];
      [self.navigationController pushViewController:pic animated:YES];
  }
//跳转
-(void)skiptofilm
{
    FilmInforViewController *film=[[FilmInforViewController alloc]init];
    [self.navigationController pushViewController:film animated:YES];
}

//实现观察者方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  
    NSIndexPath *indexPath=change[@"new"];
    
    /**
     *  新的动画效果
     */
    CATransition *transition = [CATransition animation];
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    self.navigationController.navigationBarHidden = NO;
    //根据观察者对象，实现不同方法
    if (object==_dropDownList)
    {
        FilmAreaViewController *film=[[FilmAreaViewController alloc]init];
        
        film.FilmName=_dropDownList.TitleForFilm;
        film.LowPrice=_dropDownList.LowPrice;
        film.telePhone=_dropDownList.telePhone;
        film.wxScroe=_dropDownList.ScoreNum;
        film.IDforFilm=_dropDownList.IDforFilm;
        film.Circle=_dropDownList.Street;
        [self.navigationController pushViewController:film animated:YES];
    }
    else
    {
        FilmAreaViewController *film=[[FilmAreaViewController alloc]init];
        film.FilmName=_dropDownListSecond.TitleForFilm;
        film.LowPrice=_dropDownListSecond.LowPrice;
        film.telePhone=_dropDownListSecond.telePhone;
        film.wxScroe=_dropDownListSecond.ScoreNum;
        film.IDforFilm=_dropDownListSecond.IDforFilm;
        film.Circle=_dropDownListSecond.Street;
        [self.navigationController pushViewController:film animated:YES];


    }
    
    
  
    
    
    
    
    
    
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

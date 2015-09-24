//
//  FilmAreaViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/19.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "FilmAreaViewController.h"
#import "FilmInforViewController.h"
@interface FilmAreaViewController ()

@end

@implementation FilmAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=self.FilmName;
    self.view.backgroundColor=[UIColor grayColor];
    //设置控件属性
    self.gradeLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 40)];
    self.gradeLabel.text=@"影院评分";
    self.gradeLabel.font=[UIFont systemFontOfSize:22];
    self.gradeLabel.textColor=[UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1];
    [self.view addSubview:self.gradeLabel];
    
    //设置控件属性
    self.wxratingview=[[WXRatingView alloc]initWithFrame:CGRectMake(140, 20, 250, 40)];
    self.wxratingview.scoreNum=self.wxScroe;
    [self.view addSubview:self.wxratingview];
    
    //设置控件属性
    self.lowPricelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 75, 250, 40)];
    self.lowPricelabel.text=[NSString stringWithFormat:@"最低价格      %.2f",self.LowPrice];
    self.lowPricelabel.textColor=[UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1];
    self.lowPricelabel.font=[UIFont systemFontOfSize:22];
    [self.view addSubview:self.lowPricelabel];
    //设置控件属性
    self.TelephoneLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 130, 350, 40)];
    self.TelephoneLabel.text=[NSString stringWithFormat:@"影院电话      %@",self.telePhone];
    self.TelephoneLabel.textColor=[UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1];
    self.TelephoneLabel.font=[UIFont systemFontOfSize:22];
    [self.view addSubview:self.TelephoneLabel];
    
    //设置label
    self.IdLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 190, 250, 40)];
    self.IdLabel.text=[NSString stringWithFormat:@"影院编号      %@",self.IDforFilm];
    self.IdLabel.textColor=[UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1];
    self.IdLabel.font=[UIFont systemFontOfSize:22];
    [self.view addSubview:self.IdLabel];
    
    //设置label
    self.CircleName=[[UILabel alloc]initWithFrame:CGRectMake(20, 250, 250, 40)];
    self.CircleName.text=[NSString stringWithFormat:@"影院街道      %@",self.Circle];
    self.CircleName.textColor=[UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1];
    self.CircleName.font=[UIFont systemFontOfSize:22];
    [self.view addSubview:self.CircleName];
    //设置点击按钮属性
    self.FilmButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.FilmButton setTitle:@"看电影" forState:UIControlStateNormal];
    [self.FilmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.FilmButton.titleLabel setFont:[UIFont systemFontOfSize:22]];
    self.FilmButton.titleLabel.textColor=[UIColor redColor];
    [self.FilmButton setFrame:CGRectMake(120, 370, 150, 40)];
    self.FilmButton.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.FilmButton];
    [self.FilmButton addTarget:self action:@selector(skipToFilm) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
//实现跳转方法
-(void)skipToFilm
{
    FilmInforViewController *infor=[[FilmInforViewController alloc]init];
    [self.navigationController pushViewController:infor animated:YES];
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

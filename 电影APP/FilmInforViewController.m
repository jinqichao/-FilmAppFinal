//
//  FilmInforViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/19.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "FilmInforViewController.h"
#import "SmallInformationViewController.h"
@interface FilmInforViewController ()

@end

@implementation FilmInforViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //初始化数组
    self.picArray=[NSMutableArray arrayWithCapacity:0];
    self.picArray2=[NSMutableArray arrayWithCapacity:0];
    self.view.backgroundColor=[UIColor greenColor];
    self.tableview=[[UITableView alloc]initWithFrame:self.view.frame];
//    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"jinqichao"];
    self.tableview.separatorStyle=NO;
    self.picDic=[WXDataSerivce getJSONDataWithFileName:@"cinema_detail"];
//    NSLog(@"%@",self.picDic[@"movieList"][0][@"name"]);

    [self.picArray addObjectsFromArray:self.picDic[@"movieList"]];
    for (NSDictionary *dic in self.picArray)
    {
        [self.picArray2 addObject:dic[@"logo"]];
    }

    
    self.tableview.delegate=self;
    self.tableview.dataSource=self;

    [self.view addSubview:self.tableview];
}
//实现协议里面的方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.picArray2.count;
}
//添加单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifer=@"ListCellId";
    //在表示图的闲置池里面查找闲置的单元格
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.backgroundColor=[UIColor blackColor];
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"jinqichao"];
    self.imagelogo=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 150, 150)];
    NSString *str=self.picArray2[indexPath.row];
    NSURL *url=[NSURL URLWithString:str];
    [self.imagelogo sd_setImageWithURL:url];
    
    //添加标签
    self.namelabel=[[UILabel alloc]initWithFrame:CGRectMake(190, 10, 150, 30)];
    self.namelabel.text=[NSString stringWithFormat:@"标题  %@",self.picDic[@"movieList"][indexPath.row][@"name"]];
    self.namelabel.textColor=[UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1];
    [cell.contentView addSubview:self.namelabel];
    
    self.IDlabel=[[UILabel alloc]initWithFrame:CGRectMake(190, 50, 150, 20)];
    self.IDlabel.text=[NSString stringWithFormat:@"ID  %@",self.picDic[@"movieList"][indexPath.row][@"id"]];
    
    self.IDlabel.textColor=[UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1];
    [cell.contentView addSubview:self.IDlabel];
    
    self.HighLight=[[UILabel alloc]initWithFrame:CGRectMake(190, 90, 180, 20)];
    self.HighLight.text=[NSString stringWithFormat:@"亮点  %@",self.picDic[@"movieList"][indexPath.row][@"highlight"]];
    self.HighLight.textColor=[UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1];
    [cell.contentView addSubview:self.HighLight];
    //添加自定义视图
    self.wxratingview=[[WXRatingView alloc]initWithFrame:CGRectMake(190, 130, 180, 30)];
    self.wxratingview.scoreNum=[self.picDic[@"movieList"][indexPath.row][@"grade"]floatValue];
    [cell.contentView addSubview:self.wxratingview];
    
    
    [cell.contentView addSubview:self.imagelogo];
    
    
    return cell;
}
//单元格点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //传递数据
    SmallInformationViewController *small=[[SmallInformationViewController alloc]init];
    small.titleName=self.picDic[@"movieList"][indexPath.row][@"name"];
    //传递图片
    NSString *str=self.picArray2[indexPath.row];
    small.PicStr=str;
    
    [self.navigationController pushViewController:small animated:YES];
}
//设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
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

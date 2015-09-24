//{
//"titleCn" : "摩尔庄园2海妖宝藏",
//"rating" : 7.7,
//"type" : [ "动画", "动作", "奇幻", "冒险" ],
//"release" : {
//    "location" : "中国",
//    "date" : "2012-7-5"
//}
//}
//  FilmInformationViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/18.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "FilmInformationViewController.h"

@interface FilmInformationViewController ()

@end

@implementation FilmInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=self.titlename;
    
    
    
    
    //初始化数组
    self.userImagearray=[NSMutableArray arrayWithCapacity:0];
    self.scorearray=[NSMutableArray arrayWithCapacity:0];
    self.talkarray=[NSMutableArray arrayWithCapacity:0];
    self.nicknamearray=[NSMutableArray arrayWithCapacity:0];
    NSDictionary *dict=[WXDataSerivce getJSONDataWithFileName:@"movie_comment"];
    NSArray *arraydic=[NSArray arrayWithArray:dict[@"list"]];
    //获得数据
    for (NSDictionary *dd in arraydic)
    {
        [self.userImagearray addObject:dd[@"userImage"]];
        [self.nicknamearray addObject:dd[@"nickname"]];
        [self.talkarray addObject:dd[@"content"]];
        [self.scorearray addObject:dd[@"rating"]];
    }
    
    
    self.mainTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.mainTableView.delegate=self;
    self.mainTableView.dataSource=self;

    self.mainTableView.separatorStyle=NO;
    
    [self.view addSubview:self.mainTableView];
    [self.mainTableView release];
}
//实现协议里面的方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nicknamearray.count+2;
}
//向单元格中添加内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"jinqichao"];
     static NSString *celldefiner=@"jinqichao";
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celldefiner];
    }
    
    //根据索引值添加内容
    if (indexPath.row==0)
    {
        cell.backgroundColor=[UIColor blackColor];
        
        NSDictionary *dic=[WXDataSerivce getJSONDataWithFileName:@"movie_detail"];
        UIImageView *imagepic=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 160, 150)];
        NSString *str=dic[@"image"];
        NSURL *url=[NSURL URLWithString:str];
        [imagepic sd_setImageWithURL:url];
        //手势
        UITapGestureRecognizer *utapgest=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleFingerEvent5)];
        [imagepic addGestureRecognizer:utapgest];
        imagepic.userInteractionEnabled=YES;
        
        
        
        
        
        //标签
        UILabel *firstlabel=[[UILabel alloc]initWithFrame:CGRectMake(180, 0, 180, 30)];
        firstlabel.text=dic[@"titleCn"];
        firstlabel.textColor=[UIColor redColor];
        
        UILabel *secondlabel=[[UILabel alloc]initWithFrame:CGRectMake(180, 48, 180, 20)];
       
        secondlabel.text=[NSString stringWithFormat:@"%@ %@",dic[@"directors"][0],dic[@"directors"][1]];
        secondlabel.textColor=[UIColor whiteColor];
        UILabel *exterlabel=[[UILabel alloc]initWithFrame:CGRectMake(180, 70, 180, 20)];
        exterlabel.text=[NSString stringWithFormat:@"%@ %@",dic[@"actors"][0],dic[@"actors"][1]];
        exterlabel.textColor=[UIColor whiteColor];
        
        
        
        UILabel *thirdlabel=[[UILabel alloc]initWithFrame:CGRectMake(180, 90, 180, 20)];
       
            thirdlabel.text=[NSString stringWithFormat:@"%@ %@ %@ %@",dic[@"type"][0],dic[@"type"][1],dic[@"type"][2],dic[@"type"][3]];
        thirdlabel.textColor=[UIColor whiteColor];
    
        UILabel *forthlabel=[[UILabel alloc]initWithFrame:CGRectMake(180, 120, 180, 20)];
        forthlabel.text=[NSString stringWithFormat:@"%@   %@",dic[@"release"][@"location"],dic[@"release"][@"date"]];
        forthlabel.textColor=[UIColor whiteColor];
        [cell.contentView addSubview:exterlabel];
        [cell.contentView addSubview:firstlabel];
        [cell.contentView addSubview:secondlabel];
        [cell.contentView addSubview:thirdlabel];
        //向单元格中添加
       [cell.contentView addSubview:forthlabel];
        [cell.contentView addSubview:imagepic];
        [exterlabel release];
        [firstlabel release];
        [secondlabel release];
        [thirdlabel release];
        [forthlabel release];
    }
    else if (indexPath.row==1)
    {
        
        cell.backgroundColor=[UIColor blackColor];
        NSDictionary *dic=[WXDataSerivce getJSONDataWithFileName:@"movie_detail"];
        UIImageView *image1=[[UIImageView alloc]initWithFrame:CGRectMake(5, 20, 90, 70)];
        NSString *image11=dic[@"images"][0];
        NSURL *url11=[NSURL URLWithString:image11];
        [image1 sd_setImageWithURL:url11];
        
        //添加手势
        UITapGestureRecognizer *uitap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleFingerEvent)];
        uitap1.delegate=self;
        uitap1.numberOfTapsRequired=1;
        uitap1.numberOfTouchesRequired=1;
        [image1 addGestureRecognizer:uitap1];
        image1.userInteractionEnabled=YES;
        
        
        
        
        
        
        
        
        UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectMake(95, 20, 90, 70)];
        NSString *image22=dic[@"images"][1];
        NSURL *url22=[NSURL URLWithString:image22];
        [image2 sd_setImageWithURL:url22];
        //添加手势
        UITapGestureRecognizer *uitap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleFingerEvent2)];
        uitap2.delegate=self;
        uitap2.numberOfTapsRequired=1;
        uitap2.numberOfTouchesRequired=1;
        [image2 addGestureRecognizer:uitap2];
        image2.userInteractionEnabled=YES;

        
        
        
        UIImageView *image3=[[UIImageView alloc]initWithFrame:CGRectMake(185, 20, 90, 70)];
        NSString *image33=dic[@"images"][2];
        NSURL *url33=[NSURL URLWithString:image33];
        [image3 sd_setImageWithURL:url33];
        //添加手势
        UITapGestureRecognizer *uitap3=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleFingerEvent3)];
        uitap3.delegate=self;
        uitap3.numberOfTapsRequired=1;
        uitap3.numberOfTouchesRequired=1;
        [image3 addGestureRecognizer:uitap3];
        image3.userInteractionEnabled=YES;

        
        
        
        
        
        UIImageView *image4=[[UIImageView alloc]initWithFrame:CGRectMake(275, 20, 90, 70)];
        NSString *image44=dic[@"images"][3];
        NSURL *url44=[NSURL URLWithString:image44];
        [image4 sd_setImageWithURL:url44];
        //添加手势
        UITapGestureRecognizer *uitap4=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleFingerEvent4)];
        uitap4.delegate=self;
        uitap4.numberOfTapsRequired=1;
        uitap4.numberOfTouchesRequired=1;
        [image4 addGestureRecognizer:uitap4];
        image4.userInteractionEnabled=YES;

        
        
        
        [cell.contentView addSubview:image1];
        [cell.contentView addSubview:image2];
        [cell.contentView addSubview:image3];
        [cell.contentView addSubview:image4];
        [cell.contentView release];
    }
    else
    {
        //初始化视图
        UIImageView *headview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 15, 40, 60)];
        NSString *urlstr=self.userImagearray[indexPath.row-2];
        NSURL *url=[NSURL URLWithString:urlstr];
        [headview sd_setImageWithURL:url];
        
   
        //姓名
        UILabel *namelabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 15, 140, 20)];
        namelabel.text=self.nicknamearray[indexPath.row-2];
        
        UILabel *talklabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 40, 300, 40)];
        talklabel.text=self.talkarray[indexPath.row-2];
        //得分
        UILabel *scorelabel=[[UILabel alloc]initWithFrame:CGRectMake(320, 15, 40, 20)];
        scorelabel.text=self.scorearray[indexPath.row-2];
        [cell.contentView addSubview:scorelabel];
        [cell.contentView addSubview:talklabel];
        [cell.contentView addSubview:headview];
        [cell.contentView addSubview:namelabel];
    }
    return cell;
}
//设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        return 150;
    }
    else if (indexPath.row==1)
    {
        return 110;
    }
    else
    {
        return 80;
    }
}
//跳转
- (void)handleSingleFingerEvent
{
    
    Play1ViewController *play1=[[Play1ViewController alloc]init];
    [self.navigationController pushViewController:play1 animated:YES];

}
//跳转
- (void)handleSingleFingerEvent2
{
    
    
    Play2ViewController *play2=[[Play2ViewController alloc]init];
    [self.navigationController pushViewController:play2 animated:YES];

    
}
//跳转
- (void)handleSingleFingerEvent3
{
    
    
    Play3ViewController *play3=[[Play3ViewController alloc]init];
    [self.navigationController pushViewController:play3 animated:YES];

    
}
//跳转
- (void)handleSingleFingerEvent4
{
    
    
    Play4ViewController *play4=[[Play4ViewController alloc]init];
    [self.navigationController pushViewController:play4 animated:YES];

    
}
//跳转
- (void)handleSingleFingerEvent5
{


  PlayViewController *play5=[[PlayViewController alloc]init];
 [self.navigationController pushViewController:play5 animated:YES];


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

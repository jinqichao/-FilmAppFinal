//
//  MoreViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "MoreViewController.h"
#import "WXRatingView.h"
@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"更多";
    //设置控件属性
    _tableview=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
//    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"jinqichao"];
    _tableview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.separatorStyle=NO;
    [self.view addSubview:_tableview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//实现协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
//添加单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identfier=@"jinqichao";
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    if(cell==nil)
                           {
                               cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfier];
                               cell.backgroundColor=[UIColor clearColor];
                               cell.backgroundView=nil;
                           }
    
    
    
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"jinqichao" forIndexPath:indexPath];
//    cell.backgroundColor=[UIColor whiteColor];
    NSArray *array=[NSArray arrayWithObjects:@"清除缓存",@"给个评价",@"商务合作",@"检测行版本",@"欢迎页",@"关于", nil];
    cell.textLabel.text=array[indexPath.row];
    [cell.textLabel setTextColor:[UIColor orangeColor]];
    NSArray *arraypic=[NSArray arrayWithObjects:@"moreClear.png",@"moreScore.png",@"moreBusiness.png",@"moreVersion.png",@"moreWelcome.png",@"moreAbout.png", nil];
//    cell.backgroundColor=[UIColor clearColor];
//    cell.backgroundView=nil;
   
    cell.imageView.image=[UIImage imageNamed:arraypic[indexPath.row]];
    
    //设置缓存文本大小
    UILabel *sezeLabel=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-120, 12, 100, 20)];
    sezeLabel.textAlignment=NSTextAlignmentCenter;
    sezeLabel.textColor=[UIColor whiteColor];
    sezeLabel.font=[UIFont systemFontOfSize:12];
    [cell.contentView addSubview:sezeLabel];
    if (indexPath.row==0)
    {
           sezeLabel.hidden=NO;
           sezeLabel.text=[self getImageCaCheSize];
    }
    else
    {
        sezeLabel.hidden=YES;
    }
    
    return cell;
    
}
//设置点击提示框
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"是否清除缓存" delegate:self cancelButtonTitle:nil otherButtonTitles:@"YES",@"NO", nil];
        [alter show];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (buttonIndex==0)
    {
        NSLog(@"确定");
        //使用SDwebImage内部的方法进行清除缓存
        [[SDImageCache sharedImageCache]clearDisk];
        [_tableview reloadData];
    }
}
//计算缓存大小
-(NSString *)getImageCaCheSize
{
    //获取文件地址
    long long sum=0;
    NSString *filefath=[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/com.hackemist.SDWebImageCache.default"];
    //计算文件大小
    NSFileManager *filemanage=[NSFileManager defaultManager];
    
    //获取所有文件
    NSArray *subPaths=[filemanage subpathsAtPath:filefath];
    
    //遍历路径
    for (NSString *subpath in subPaths)
    {
        NSString *imagePath=[filefath stringByAppendingPathComponent:subpath];
        
        //获取当前图片大小
        NSDictionary *imagedic=[filemanage attributesOfItemAtPath:imagePath error:nil];
        sum+=[imagedic fileSize];
    }
    return [NSString stringWithFormat:@"%.2fm",sum/(1000.0*1000.0)];
    
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

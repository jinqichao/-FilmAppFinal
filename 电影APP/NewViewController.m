//
//  NewViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "NewViewController.h"
#import "XLSCollectionViewController.h"
#import "WebinformationViewController.h"
@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化控件和数据
    self.arraypicture=[NSMutableArray arrayWithCapacity:0];
    self.postNameArray=[NSMutableArray arrayWithCapacity:0];
     self.title=@"新闻";
    [self _initViews];
    self.datalist=[NSMutableArray arrayWithCapacity:0];
    [self _loadData];
    //添加观察者
    [_newsTableView addObserver:self forKeyPath:@"indexpath" options:NSKeyValueObservingOptionNew context:nil];
    
    self.navigationItem.hidesBackButton=YES;
    
}
-(void)_initViews
{
    //初始化控件
    _newsTableView=[[newsTableView alloc]initWithFrame:CGRectMake(0, 150, kScreenWidth, kScreenHeight-150) style:UITableViewStylePlain];
    [self.view addSubview:_newsTableView];
    
    self.SkipButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.SkipButton setFrame:_newsTableView.frame];
    [self.SkipButton addTarget:self action:@selector(skiptonext) forControlEvents:UIControlEventTouchUpInside];

    
    //初始化控件
    self.mainimageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    self.datalist= [WXDataSerivce getJSONDataWithFileName:@"news_list"];
    for (NSDictionary *dic in self.datalist) {
        [self.arraypicture addObject:dic[@"image"]];
        [self.postNameArray addObject:dic[@"title"]];
        }
    //解析数据
    NSURL *url=[NSURL URLWithString:self.arraypicture[0]];
    [self.mainimageview sd_setImageWithURL:url];
    
    self.postName=[[UILabel alloc]initWithFrame:CGRectMake(40, 130, 300, 20)];
    self.postName.text=self.postNameArray[0];
    self.postName.textColor=[UIColor whiteColor];
//    NSLog(@"%@",self.postName);
//    [self.view addSubview:self.SkipButton];
    [self.view addSubview:self.mainimageview];
     [self.view addSubview:self.postName];
}
//跳转
-(void)skiptonext
{
    XLSCollectionViewController *xls=[[XLSCollectionViewController alloc]init];
    [self.navigationController pushViewController:xls animated:YES];
}
//刷新数据
-(void)_loadData
{
    
    self.datalist= [WXDataSerivce getJSONDataWithFileName:@"news_list"];
    _newsTableView.datalist=self.datalist;
    [_newsTableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//实现观察者方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  
    NSIndexPath *indexPath=change[@"new"];
    //根据值的变化分别进行页面跳转
    if ([_newsTableView.numberindex intValue]==0)
    {
       
        XLSCollectionViewController *xls=[[XLSCollectionViewController alloc]init];
        xls.titlename=_newsTableView.titlepost;
        
        [self.navigationController pushViewController:xls animated:YES];
        [xls release];
    }
    else
    {
        WebinformationViewController*web=[[WebinformationViewController alloc]init];
        web.titlename=_newsTableView.titlepost;
        [self.navigationController pushViewController:web animated:YES];
         [web release];
    }
    
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

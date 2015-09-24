//
//  Play1ViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/19.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "Play1ViewController.h"

@interface Play1ViewController ()

@end

@implementation Play1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backtotop)];
    self.navigationItem.leftBarButtonItem=left;
    //解析数据
    NSDictionary *playdic=[WXDataSerivce getJSONDataWithFileName:@"movie_detail"];
    //创建链接
    UIWebView *webview=[[UIWebView alloc]initWithFrame:self.view.frame];
    NSURLRequest *request1=[NSURLRequest  requestWithURL:[NSURL URLWithString:playdic[@"videos"][0][@"url"]]];
    
    [self.view addSubview:webview];
    [webview loadRequest:request1];
}
//实现跳转
-(void)backtotop
{
    [self.navigationController popViewControllerAnimated:YES];
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

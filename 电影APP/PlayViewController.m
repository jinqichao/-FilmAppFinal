//
//  PlayViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/19.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
        UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backtotop)];
        self.navigationItem.leftBarButtonItem=left;
        //获取数据
        NSDictionary *playdic=[WXDataSerivce getJSONDataWithFileName:@"movie_detail"];
        
        UIWebView *webview=[[UIWebView alloc]initWithFrame:self.view.frame];
        NSURLRequest *request1=[NSURLRequest  requestWithURL:[NSURL URLWithString:playdic[@"url"]]];
        
        [self.view addSubview:webview];
        [webview loadRequest:request1];
 
}
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

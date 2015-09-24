//
//  WebinformationViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/18.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "WebinformationViewController.h"

@interface WebinformationViewController ()

@end

@implementation WebinformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=self.titlename;
    self.view.backgroundColor=[UIColor whiteColor];
    [self _initViews];
    [self _initload];
}
-(void)_initload
{
    //解析数据
    NSDictionary *newdic=[WXDataSerivce getJSONDataWithFileName:@"news_detail"];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    
    NSString *html=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    //获取具体数据
    NSString *title=newdic[@"title"];
    NSString *source=newdic[@"source"];
    NSString *time=newdic[@"time"];
    NSString *content=newdic[@"content"];
    NSString *author=newdic[@"author"];
    NSString *htmlString=[NSString stringWithFormat:html,title,source,time,content,author];
    
    NSURL *baseurl=[[NSBundle mainBundle]resourceURL];
    [self.myWebView loadHTMLString:htmlString baseURL:baseurl];
}
-(void)_initViews
{
    //初始化数据
    self.myWebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    [self.myWebView setScalesPageToFit:YES];
    [self.view addSubview:self.myWebView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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

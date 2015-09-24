//
//  SrcollViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/18.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "SrcollViewController.h"

@interface SrcollViewController ()

@end

@implementation SrcollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pictureArray=[NSMutableDictionary dictionaryWithCapacity:0];
    //解析数据
    NSArray *result=[WXDataSerivce getJSONDataWithFileName:@"image_list"];
    for (NSDictionary *dic in result)
    {
        [self.pictureArray setDictionary:dic];
    }
    

    [self.pictureScrollerView addSubview:self.pictureImage];
    
    
    //设置控件属性
    self.pictureScrollerView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.pictureScrollerView.contentSize=CGSizeMake(WIDTH*self.pictureArray.count, HEIGHT-100);
    self.pictureScrollerView.showsHorizontalScrollIndicator=NO;
    self.pictureScrollerView.showsVerticalScrollIndicator=NO;
    self.pictureScrollerView.alwaysBounceVertical=NO;
    self.pictureScrollerView.delegate=self;
    self.pictureScrollerView.pagingEnabled=YES;
    [self.view addSubview:self.pictureScrollerView];
    
    
    
    
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

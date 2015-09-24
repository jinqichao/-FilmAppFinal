//
//  BaseNavigationController.m
//  电影APP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏背景图片
    UIImage *image=[UIImage imageNamed:@"nav_bg_all"];
    CGImageRef imageRef=CGImageCreateWithImageInRect(image.CGImage, CGRectMake(160, 0, kScreenWidth, 64));
    [self.navigationBar setBackgroundImage:[UIImage imageWithCGImage:imageRef] forBarMetrics:UIBarMetricsDefault];
    //释放图片对象
    CGImageRelease(imageRef);
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

//
//  FirstenterViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "MainTabBarController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface FirstenterViewController : UIViewController<UIScrollViewDelegate>
//滑块
@property(strong,nonatomic)UIScrollView *mainScrollView;
//跳转
@property(strong,nonatomic)UIButton *skipbutton;
@end

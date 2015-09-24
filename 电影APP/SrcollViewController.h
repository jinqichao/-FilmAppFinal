//
//  SrcollViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/18.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface SrcollViewController : BaseViewController<UIScrollViewDelegate>
//滑块
@property(strong,nonatomic)UIScrollView *pictureScrollerView;

//图片集合
@property(strong,nonatomic)NSMutableDictionary *pictureArray;
//图片字典
@property(strong,nonatomic)NSDictionary *picturedic;
//图片容器
@property(strong,nonatomic)UIImageView *pictureImage;
@end

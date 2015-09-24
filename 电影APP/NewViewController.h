//
//  NewViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"
#import "newsTableView.h"

@interface NewViewController : BaseViewController
{
    newsTableView *_newsTableView;
}


@property(strong,nonatomic)UIImageView *mainimageview;
@property(strong,nonatomic)NSMutableArray *datalist;
//收集图片
@property(strong,nonatomic)NSMutableArray *arraypicture;

@property(strong,nonatomic)UILabel *postName;


@property(strong,nonatomic)NSMutableArray *postNameArray;
@property(strong,nonatomic)NSString *postNameTitle;


@property(strong,nonatomic)UIButton *SkipButton;



@end

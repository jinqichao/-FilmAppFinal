//
//  FilmInformationViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/18.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"
#import "Play1ViewController.h"
#import "Play2ViewController.h"
#import "Play3ViewController.h"
#import "Play4ViewController.h"
#import "PlayViewController.h"
@interface FilmInformationViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
@property(strong,nonatomic)UITableView *mainTableView;

//数组
@property(strong,nonatomic)NSMutableArray *nicknamearray;
@property(strong,nonatomic)NSMutableArray *userImagearray;
@property(strong,nonatomic)NSMutableArray *talkarray;
@property(strong,nonatomic)NSMutableArray *scorearray;

//标题名字
@property(strong,nonatomic)NSString *titlename;
//跳转按钮
@property(strong,nonatomic)UIButton *skipfirst;
@end

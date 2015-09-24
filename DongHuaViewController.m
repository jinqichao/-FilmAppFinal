//
//  DongHuaViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "DongHuaViewController.h"
#import "MainTabBarController.h"
#import "AppDelegate.h"
@interface DongHuaViewController ()

@end

@implementation DongHuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _donghuaView = [[FirstDongHuaView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_donghuaView];
    
    self.array = [NSMutableArray arrayWithObjects:@"1",@"5",@"9",@"13",@"17",@"21",@"22",@"23",@"24",@"20",@"16",@"12",@"8",@"4",@"3",@"2",@"6",@"10",@"14",@"18",@"19",@"15",@"11",@"7", nil];
    
    self.indexNum = 0;
    
    //初始化
    self.dataList = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < 24; i++) {
        [self.dataList addObject:@"temp"];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(getImage) userInfo:nil repeats:YES];

}


- (void)getImage {
    

    [self.dataList replaceObjectAtIndex:[self.array[self.indexNum] integerValue] - 1 withObject:[NSString stringWithFormat:@"%@",self.array[self.indexNum]]];


    _donghuaView.dataList = self.dataList;
    [_donghuaView reloadData];
    self.indexNum++;
    if (self.indexNum == 24) {
        [_timer invalidate];
        
        //创建tabbar
        MainTabBarController * mainTBC = [[MainTabBarController alloc] init];
        
        [UIApplication sharedApplication].delegate.window.rootViewController = mainTBC;
        
        [mainTBC release];
    }

    
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

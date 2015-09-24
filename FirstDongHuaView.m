//
//  FirstDongHuaView.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "FirstDongHuaView.h"

@implementation FirstDongHuaView
- (instancetype)initWithFrame:(CGRect)frame {
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    CGFloat space = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(space, space, space, space);
    
    CGFloat itemWidth = (kScreenWidth - 5 * space) / 4;
    NSLog(@"%f",itemWidth);
    
    CGFloat itemHeight = kScreenHeight / 7;
    NSLog(@"%f",itemHeight);
    flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
    //单元格大小
    
    if (self = [super initWithFrame:frame collectionViewLayout:flowLayout]) {
        
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        
        //注册
        [self registerClass:[FirstCollectionViewCell class] forCellWithReuseIdentifier:@"first"];
        
        //数据源
        self.dataList = [NSMutableArray arrayWithCapacity:1];
       
        
        
       
    }
    
    
    [flowLayout release];
    
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
#pragma mark --- UICollectionViewDatasource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FirstCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"first" forIndexPath:indexPath];
    NSLog(@"%@",self.dataList);
    cell.imageString = self.dataList[indexPath.row];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

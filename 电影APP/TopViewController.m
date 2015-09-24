//
//  TopViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "TopViewController.h"
#import "FilmInformationViewController.h"
@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"TOP250";
    //设置布局
    UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc]init];
//    [flowlayout setFooterReferenceSize:CGSizeMake(100, 200)];
    self.Topcollection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:flowlayout];
    [self.Topcollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"jinqichao"];
    self.Topcollection.delegate=self;
    self.Topcollection.dataSource=self;
    [self.view addSubview:self.Topcollection];
    
    [self.Topcollection release];
}
//实现协议里面的方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
//设置布局大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 200);
}
//设置单元格内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"jinqichao" forIndexPath:indexPath];
    self.picimageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 150)];
    [cell.contentView addSubview:self.picimageview];
    
    self.wxratingview=[[WXRatingView alloc]initWithFrame:CGRectMake(0, 150, 100, 28)];
    
    
    //获取数据并赋值
     NSDictionary *result=[WXDataSerivce getJSONDataWithFileName:@"top250"];
     NSArray *subjects=result[@"subjects"];
    self.titiledic=subjects;
    self.ScoreDic=subjects[indexPath.row];
    self.wxratingview.scoreNum=[self.ScoreDic[@"rating"][@"average"]floatValue];
    [cell.contentView addSubview:self.wxratingview];
    
    self.picDic=subjects[indexPath.row];
    NSString *str=self.picDic[@"images"][@"large"];
    NSURL *url=[NSURL URLWithString:str];
    [self.picimageview sd_setImageWithURL:url];
    
    
    
    
    
    return cell;
}
//单元格点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FilmInformationViewController *film=[[FilmInformationViewController alloc]init];
    //传值
    film.titlename=self.titiledic[indexPath.row][@"title"];
    [self.navigationController pushViewController:film animated:YES];
}
//单元格间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 10, 20, 10);
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

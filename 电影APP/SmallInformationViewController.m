//
//  SmallInformationViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/20.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "SmallInformationViewController.h"

@interface SmallInformationViewController ()

@end

@implementation SmallInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    //初始化uicollectionview
    UICollectionViewFlowLayout *flowLayOut=[[UICollectionViewFlowLayout alloc]init];
    [flowLayOut setItemSize:CGSizeMake(30, 30)];
    //设置控件属性
    self.collectionview=[[UICollectionView alloc]initWithFrame:CGRectMake(10, 180,350, 360) collectionViewLayout:flowLayOut];
    self.collectionview.backgroundColor=[UIColor blackColor];
    self.collectionview.delegate=self;
    self.collectionview.dataSource=self;
    //设置控件属性
    self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(35, 0, 300, 40)];
    self.titleLabel.text=self.titleName;
    self.titleLabel.textColor=[UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1];
    self.titleLabel.font=[UIFont systemFontOfSize:22];
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.titleLabel];
    
    self.PicImageView=[[UIImageView alloc]initWithFrame:CGRectMake(85, 42, 200,140)];

    NSURL *url=[NSURL URLWithString:self.PicStr];
    [self.PicImageView sd_setImageWithURL:url];

    
    
//    self.PicImageView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:self.PicImageView];
    [self.collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"jinqichao"];
    
    
    [self.view addSubview:self.collectionview];
}
//实现协议方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 72;
}
//向单元格中添加内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"jinqichao" forIndexPath:indexPath];
    //添加显示数组
    NSMutableArray *array=[NSMutableArray arrayWithCapacity:0];
    for (int i=1; i<=72; i++)
    {
        [array addObject:[NSString stringWithFormat:@"%d",i]];
    }
    cell.backgroundColor=[UIColor whiteColor];
    //添加显示内容
    self.label =[[UILabel alloc]initWithFrame:cell.bounds];
    self.label.text=array[indexPath.row];
    self.label.textAlignment=NSTextAlignmentCenter;
    [cell.contentView addSubview:self.label];
    
    
    
    return cell;
}
//实现点击单元格事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
    if (cell.backgroundColor==[UIColor whiteColor])
    {
        cell.backgroundColor=[UIColor redColor];
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"购票成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alter show];
    }
    else
    {
        cell.backgroundColor=[UIColor whiteColor];
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"退选成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
         [alter show];

    }
   
}
//设置单元格之间的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
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

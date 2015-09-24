// image_list
//  XLSCollectionViewController.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "XLSCollectionViewController.h"
#import "SrcollViewController.h"
@interface XLSCollectionViewController ()
@property(assign,nonatomic)BOOL isBigLayout;
@property(strong,nonatomic)UICollectionViewFlowLayout *flowout;
@property(strong,nonatomic)UICollectionViewFlowLayout *flowbig;

@end

@implementation XLSCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pictureArray=[NSMutableArray arrayWithCapacity:0];
    
    self.title=self.titlename;
    //设置布局
    self.flowout=[[UICollectionViewFlowLayout alloc]init];
    [self.flowout setItemSize:CGSizeMake(60,60)];
    
    
    
    
    //设置控件基本属性
    self.postInformationView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-110) collectionViewLayout:self.flowout];
    
    self.postInformationView.delegate=self;
    self.postInformationView.dataSource=self;
    [self.postInformationView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"jinqichao"];
    

    NSArray *result=[WXDataSerivce getJSONDataWithFileName:@"image_list"];
    for (NSDictionary *dic in result)
    {
        [self.pictureArray addObject:dic];
    }
    
    [self.view addSubview:self.postInformationView];
    
    [self.postInformationView release];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//定义展示单元格的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.pictureArray.count;
}
//定义展示分区数量
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//定义展示内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"jinqichao" forIndexPath:indexPath];
    self.pictureImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.width, cell.height)];
    
    self.picturedic=self.pictureArray[indexPath.row];
    
    
    NSString *urlstring=[self.picturedic valueForKey:@"image"];
    NSURL *url=[NSURL URLWithString:urlstring];
    [self.pictureImage sd_setImageWithURL:url];
    [cell.contentView addSubview:self.pictureImage];
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
//    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
//
//    [cell.contentView addGestureRecognizer:tap];
    
    //变大后的布局
    self.flowbig=[[UICollectionViewFlowLayout alloc]init];
    self.flowbig.itemSize=CGSizeMake(kScreenWidth, 300);
   self.flowbig.scrollDirection=UICollectionViewScrollDirectionHorizontal;
   
    //设置点击切换布局
    if (self.isBigLayout==NO)
    {
        [self.postInformationView setCollectionViewLayout:self.flowbig animated:YES];
      
    }
    else
    {
          [self.postInformationView setCollectionViewLayout:self.flowout animated:YES];
       
    }
//    [self.postInformationView reloadData];
    //刷新布局
    [self.postInformationView reloadSections:[NSIndexSet indexSetWithIndex:0]];
     self.isBigLayout=!self.isBigLayout;
    
}
//-(void)tap
//{
//    NSLog(@"1");
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  PostHeaderCollectionView.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "PostHeaderCollectionView.h"
#import "PostHeaderCell.h"
#import "PostHeaderCollectionView.h"
@implementation PostHeaderCollectionView
-(instancetype)initWithFrame:(CGRect)frame
{
    //设置布局
    UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc]init];
    //设置单元格大小
    flowlayout.itemSize=CGSizeMake(70, 90);
    //取消单元格间距
    flowlayout.minimumLineSpacing=0;
    flowlayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    self=[super initWithFrame:frame collectionViewLayout:flowlayout];
    if (self)
    {
        self.delegate=self;
        self.dataSource=self;
        
        //设置单元格复用类
        [self registerClass:[PostHeaderCell class] forCellWithReuseIdentifier:@"jinqichao"];
        
        self.backgroundColor=[UIColor clearColor];
        self.backgroundView=nil;
        //取消滑动指示器
        self.showsHorizontalScrollIndicator=NO;
        //设置滑动视图的内填充
       _edge=(kScreenWidth-70)/2.0;
        self.contentInset=UIEdgeInsetsMake(0, _edge, 0, _edge);
        
        //记录中心单元格
        self.selectIndexPath=[NSIndexPath indexPathForRow:0 inSection:0];
        //设置加速效果
        self.decelerationRate=UIScrollViewDecelerationRateFast;
        
//        self.bounces=NO;
    }
    return self;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datalist.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostHeaderCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"jinqichao" forIndexPath:indexPath];
    
    //把电影信息给单元格
    cell.model=self.datalist[indexPath.row];
    
    //手动调用单元格
    [cell setNeedsLayout];
    return cell;
}
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    if (decelerate==NO)
//    {
//        int pageIndex=(int)(scrollView.contentOffset.x+_edge+35)/70;
////        NSLog(@"%d",pageIndex);
//        [scrollView setContentOffset:CGPointMake(pageIndex *70-_edge, 0) animated:YES];
//    }
//}
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    int pageIndex=(int)(scrollView.contentOffset.x+_edge+35)/70;
////    NSLog(@"%d",pageIndex);
//    
//    [scrollView setContentOffset:CGPointMake(pageIndex *70-_edge, 0) animated:YES];
//}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //    decelerate 是否有加速
    if (decelerate == NO) {
        //    如果没有加速，就计算那单元格在中心点，滑动到该单元格的中心位置
        int pageIndex = (int)(scrollView.contentOffset.x + _edge + 35)/70;
//        NSLog(@"pageIndex:%d",pageIndex);
        [scrollView setContentOffset:CGPointMake(pageIndex * 70 - _edge, 0) animated:YES];
        
    }
}
// 滑动视图由惯性滑动停止的时候调用的协议方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 如果没有加速，就计算那个单元格在中心点，滑动到该单元格的中心位置
    int pageIndex = (int)(scrollView.contentOffset.x + _edge + 35) / 70;
    NSLog(@"pageIndex:%d",pageIndex);
    self.selectIndexPath = [NSIndexPath indexPathForRow:pageIndex inSection:0];
    // 让某一个单元格滑动到指定位置
    [scrollView setContentOffset:CGPointMake(pageIndex * 70 - _edge, 0) animated:YES];
}
////视图滑动时调用的协议方法
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    //获取当前所显示的单元格索引集合
//    NSArray *indexpaths=[self indexPathsForVisibleItems];
//    
////    NSLog(@"-------");
//    //遍历索引集合
//    for (NSIndexPath *indexpath in indexpaths)
//    {
//        CATransform3D transform3dscale=CATransform3DMakeScale(.95, .95, .95);
//        
//        //设置远近效果
//        transform3dscale.m34=-.002f;
//        
//    }
//}
//
////这个方法实在手指拖拽视图结束时调用的,ielocity:加速状态(可以判断滑动方向)，targetcontentoffset让滑动视图到指定位置
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
//{
//    //获取单元格宽度
//    float rowwidth=70;
//    //获取当前单元格需要在中心实现
//  
//    if (velocity.x>=0.5)
//    {
//        //当手指离开视图时，惯性足够大的时候可以让它滑动到下一个视图
//        //获取滑动之前的单元格位置
//        
//        int beforeRow=(int)self.selectIndexPath.row;
//        //记录新的单元格的位置
//        if (beforeRow<=9)
//        {
//            self.selectIndexPath=[NSIndexPath indexPathForRow:beforeRow+1 inSection:0];
//            
//            targetContentOffset->x=(beforeRow +1)*rowwidth-_edge;
//        }
//        
//
//    
//    }
//    else if (velocity.x<=-0.5)
//    {
//        //回到上一个
//        int beforeRow=(int)self.selectIndexPath.row;
//        //记录新单元格的位置
//        if (beforeRow>=1)
//        {
//            self.selectIndexPath=[NSIndexPath indexPathForRow:beforeRow-1 inSection:0];
//            targetContentOffset->x=(beforeRow-1)*rowwidth-_edge;
//
//        }
//    }
//    else
//    {
//        //获取单元格手指离开时候的中心单元格
//        int pageIndex=(int)(scrollView.contentOffset.x+_edge+rowwidth/2.0)/(int)rowwidth;
////        NSLog(@"%d",pageIndex);
//        //记录当前单元格
//        self.selectIndexPath=[NSIndexPath indexPathForRow:pageIndex inSection:0];
//        targetContentOffset->x=-_edge+pageIndex *rowwidth;
//    }
////    NSLog(@"%f",velocity.x);
//}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

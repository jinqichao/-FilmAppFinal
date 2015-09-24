//
//  PosterBodyCollectionView.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "PosterBodyCollectionView.h"
#import "PosterBodyCell.h"
#import "MovieModel.h"
#import "PosterView.h"
@implementation PosterBodyCollectionView
//重写布局方法
-(instancetype)initWithFrame:(CGRect)frame
{
    //创建布局
    UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc]init];
    //设置大小
    flowlayout.itemSize=CGSizeMake(kScreenWidth *.7, frame.size.height-10);
    //设置滑动方法
    flowlayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    //设置单元格间距
    flowlayout.minimumLineSpacing=0;
    
    self=[super initWithFrame:frame collectionViewLayout:flowlayout];
    if (self)
    {
        //设置代理
        self.delegate=self;
        self.dataSource=self;
        
        //创建单元格
        [self registerClass:[PosterBodyCell class] forCellWithReuseIdentifier:@"jinqichao"];
        
        //设置背景颜色为透明
        self.backgroundColor=[UIColor clearColor];
        self.backgroundView=nil;
        //取消滑动指示器
        self.showsHorizontalScrollIndicator=NO;
        
        //设置内填充
        //单元格填充距离
        _edge=kScreenWidth * .3/2.0;
        self.contentInset=UIEdgeInsetsMake(0, _edge, 0, _edge);
        //记录当前中心单元格位置
        self.selectIndexPath=[NSIndexPath indexPathForRow:0 inSection:0];
        
    }
    return self;
    
    
    
}
    
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datalist.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //视图去闲置池寻找闲置的单元格，如果没找到，调用系统
   PosterBodyCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"jinqichao" forIndexPath:indexPath];
   //设置图片为正面
    cell.PicBool=YES;
    
  
    
    
    
    NSDictionary *result=[WXDataSerivce getJSONDataWithFileName:@"us_box"];
    NSArray *subjects=result[@"subjects"];
    self.dataList=subjects;
    cell.datadic=self.dataList[indexPath.row];
   
    
    
    
    
    cell.model=self.datalist[indexPath.row];
    //手动调用单元格重写的方法
    [cell setNeedsLayout];
    return cell;
}
//海报视图3D滑动效果
-(void)drawRect:(CGRect)rect
{
    //手动调用
    [self scrollViewDidScroll:self];
}
//视图滑动时调用的协议方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取当前所显示的单元格索引集合
    NSArray *indexpaths=[self indexPathsForVisibleItems];
    
//    NSLog(@"-------");
    //遍历索引集合
    for (NSIndexPath *indexpath in indexpaths)
    {
        //通过单元格索引位置获取单元格
        PosterBodyCell *cell=(PosterBodyCell *)[self cellForItemAtIndexPath:indexpath];
        
        //如果图片不为正面,则翻页
        if (cell.PicBool==NO)
        {
            [cell tapAction];
        }
        
        
        
        //计算当前单元格距离中心点的长度
        //当前单元格在中心时视图的偏移量=单元格索引位置*单元格宽度-填充
        float contentOffset_x=indexpath.row *(kScreenWidth *.7)-_edge;
        
        float lenght=self.contentOffset.x-contentOffset_x;
//        NSLog(@"%f",lenght);
        
        float rotate=lenght/224.0 * (M_PI_4/2);
        
        CATransform3D transform3dscale=CATransform3DMakeScale(.95, .95, .95);
        
        //设置远近效果
        transform3dscale.m34=-.002f;
        
        //设置旋转
        CATransform3D transform3d=CATransform3DRotate(transform3dscale, rotate, 0, 1, 0);
        cell.baseView.layer.transform=transform3d;
    }
}
//这个方法实在手指拖拽视图结束时调用的,ielocity:加速状态(可以判断滑动方向)，targetcontentoffset让滑动视图到指定位置
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //获取单元格宽度
    float rowwidth=kScreenWidth * .7;
    //获取当前单元格需要在中心实现
    
    if (velocity.x>=0.5)
    {
        //当手指离开视图时，惯性足够大的时候可以让它滑动到下一个视图
        //获取滑动之前的单元格位置
        int beforeRow=(int)self.selectIndexPath.row;
        //记录新的单元格的位置
        if (beforeRow<=9)
        {
            self.selectIndexPath=[NSIndexPath indexPathForRow:beforeRow+1 inSection:0];
            
            targetContentOffset->x=(beforeRow +1)*rowwidth-_edge;

        }
    }
    else if (velocity.x<=-0.5)
    {
        //回到上一个
        int beforeRow=(int)self.selectIndexPath.row;
        //记录新单元格的位置
        if (beforeRow>=1)
        {
            self.selectIndexPath=[NSIndexPath indexPathForRow:beforeRow-1 inSection:0];
            targetContentOffset->x=(beforeRow-1)*rowwidth-_edge;
        }
    }
    else
    {
        //获取单元格手指离开时候的中心单元格
        int pageIndex=(int)(scrollView.contentOffset.x+_edge+rowwidth/2.0)/(int)rowwidth;
//        NSLog(@"%d",pageIndex);
        //记录当前单元格
        self.selectIndexPath=[NSIndexPath indexPathForRow:pageIndex inSection:0];
        targetContentOffset->x=-_edge+pageIndex *rowwidth;
    }
//    NSLog(@"%f",velocity.x);
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

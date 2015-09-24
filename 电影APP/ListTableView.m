//
//  ListTableView.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "ListTableView.h"
#import "ListCell.h"
@implementation ListTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)styles
{
    self=[super initWithFrame:frame style:styles];
    if (self)
    {
        self.delegate=self;
        self.dataSource=self;
        //设置表视图背景颜色
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main.png"]];
        self.backgroundView=nil;
    }
    return self;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer=@"ListCellId";
    //在表示图的闲置池里面查找闲置的单元格
    ListCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell==nil)
    {
        cell=[[ListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
        //获取单元格对应的字典
    cell.dic=self.dataList[indexPath.row];
    
    return cell;
    
}
//设置选中单元格就出现一个带透明的样式
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListCell *cell=(ListCell *)[tableView cellForRowAtIndexPath:indexPath];
    if ([cell viewWithTag:1111]==nil)
    {
        UIView *viewBg=[[UIView alloc]initWithFrame:cell.bounds];
        viewBg.tag=1111;
        viewBg.backgroundColor=[UIColor grayColor];
        viewBg.alpha=0.4;
        [cell addSubview:viewBg];
        [viewBg release];
    }
    
}
//设置取消单元格则移除
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListCell *cell=(ListCell *)[tableView cellForRowAtIndexPath:indexPath];
    UIView *viewbg=(UIView *)[cell viewWithTag:1111];
    [viewbg removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

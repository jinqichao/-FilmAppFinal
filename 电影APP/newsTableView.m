//
//  newsTableView.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "newsTableView.h"
#import "NewsTableViewCell.h"
#import "XLSCollectionViewController.h"
#import "NewViewController.h"
@implementation newsTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    //初始化布局
    self=[super initWithFrame:frame style:style];
    if (self)
    {
    self.indexpath=0;
        self.delegate=self;
        self.dataSource=self;
        self.backgroundColor=[UIColor blackColor];
        self.backgroundView=nil;
    
    
    
       
    }
//    self.separatorStyle=NO;
    return self;
}
//实现协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datalist.count-1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *iden=@"iden";
   
    NewsTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil)
    {
        cell=[[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        
    }
    
    cell.dic=self.datalist[indexPath.row+1];
    

    
    
     _albumbutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_albumbutton setFrame:CGRectMake(70, 50, 20, 20)];
    [_albumbutton setImage:[UIImage imageNamed:@"scspxw"] forState:UIControlStateNormal];
    if ([cell.dic[@"type"] isEqualToNumber:@1])
    {
        [cell.contentView addSubview:_albumbutton];
    }
    
   
    
   
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
         return 90;
  
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dict=[NSDictionary dictionaryWithDictionary:self.datalist[indexPath.row+1]];
    
    self.titlepost=dict[@"title"];

    self.numberindex=self.datalist[indexPath.row][@"type"];
    
    self.indexpath++;
   
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

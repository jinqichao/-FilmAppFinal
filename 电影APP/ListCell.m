//
//  ListCell.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell
// 重写我们创建单元格时使用的初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //去除背景颜色
        self.backgroundColor=[UIColor clearColor];
        self.backgroundView=nil;
        //创建子视图
        [self _initViews];
    }
    return self;
}
- (void)awakeFromNib {
    
}
//创建子视图
-(void)_initViews
{
    //创建标题图片
    _titleImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 90)];
    [self.contentView addSubview:_titleImageView];
    
    
    //创建标题文本
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(_titleImageView.right+10, 15, 150, 20)];
    _titleLabel.font=[UIFont boldSystemFontOfSize:14];
    _titleLabel.textColor=[UIColor orangeColor];
    [self.contentView addSubview:_titleLabel];
    
    //创建年份文本
    _yearLabel=[[UILabel alloc]initWithFrame:CGRectMake(_titleLabel.left, 80, 150, 20)];
    _yearLabel.font=[UIFont boldSystemFontOfSize:12];
    _yearLabel.textColor=[UIColor whiteColor];
    [self.contentView addSubview:_yearLabel];
    
    _wxratingview=[[WXRatingView alloc]initWithFrame:CGRectMake(_titleLabel.left+5, 35, 300, 40)];
    [self.contentView addSubview:_wxratingview];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    //设置子视图的内容
    //设置图片
    NSString *urlstring=self.dic[@"subject"][@"images"][@"medium"];
//    NSLog(@"%@",urlstring);
    //把字符串换成路径
    NSURL *url=[NSURL URLWithString:urlstring];
    [_titleImageView sd_setImageWithURL:url];
    
    //设置标题
   _titleLabel.text=self.dic[@"subject"][@"title"];
    
    
    
    self.titlearray=[NSMutableArray arrayWithCapacity:0];
    [self.titlearray addObject:self.dic[@"subject"][@"title"]];
//    NSLog(@"%@",self.titlearray);
    //设置年份
    _yearLabel.text=self.dic[@"subject"][@"year"];
    //设置星星和分数
    _wxratingview.scoreNum=[self.dic[@"subject"][@"rating"][@"average"] floatValue];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    //设置选定单元格样式
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the view for the selected state
}

@end

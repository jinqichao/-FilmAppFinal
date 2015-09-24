//
//  NewsTableViewCell.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //初始化
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor=[UIColor clearColor];
        self.backgroundView=nil;
        [self _initViews];
   
    
        
    }
    return self;
}
-(void)_initViews
{
    //初始化控件属性
    _titleImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
    [self.contentView addSubview:_titleImageView];
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(_titleImageView.right+10, 15, 280, 20)];
    _titleLabel.font=[UIFont boldSystemFontOfSize:14];
    _titleLabel.textColor=[UIColor orangeColor];
    [self.contentView addSubview:_titleLabel];
    
    _contextLabel=[[UILabel alloc]initWithFrame:CGRectMake(_titleLabel.left+20, 50, 280, 20)];
    _contextLabel.textColor=[UIColor whiteColor];
    [self.contentView addSubview:_contextLabel];
    
    
  

   
    
    
    
    
    
    
    
}
-(void)layoutSubviews
{
    //调用系统方法,刷新布局
    [super layoutSubviews];
    
    
    NSString *urlstring=self.dic[@"image"];
    NSURL *url=[NSURL URLWithString:urlstring];
    [_titleImageView sd_setImageWithURL:url];
    
    _type=self.dic[@"type"];
   
    
    
    _titleLabel.text=self.dic[@"title"];
    _contextLabel.text=self.dic[@"summary"];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

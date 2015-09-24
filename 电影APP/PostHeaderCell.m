//
//  PostHeaderCell.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "PostHeaderCell.h"

@implementation PostHeaderCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        _imageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_imageView];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    //设置图片的大小和位置
    _imageView.frame=CGRectMake(5, 0, 60, 90);
    NSURL *imageurl=[NSURL URLWithString:self.model.image_medium];
    [_imageView sd_setImageWithURL:imageurl];
}
@end

//
//  NewsTableViewCell.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
//添加成员变量
{
    UIImageView *_titleImageView;
    UILabel *_titleLabel;
    UILabel *_contextLabel;
 
    NSString *_type;
}
//数据源
@property(nonatomic,retain)NSDictionary *dic;
@end

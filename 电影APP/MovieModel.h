//
//  MovieModel.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject
//电影评分
@property(assign,nonatomic)float scoreNum;
//小海报图片
@property(copy,nonatomic)NSString *image_small;
//中海报图片
@property(copy ,nonatomic)NSString *image_medium;
//大海报图片
@property(copy ,nonatomic)NSString *image_large;
//电影标题
@property(copy,nonatomic)NSString *title;
//电影类型
@property(copy,nonatomic)NSString *subtype;
//电影年份
@property(copy,nonatomic)NSString *year;
//英文标题
@property(copy,nonatomic)NSString *original_title;


//自定义初始化方法
-(instancetype)initwithContentOfDic:(NSDictionary *)dic;
@end

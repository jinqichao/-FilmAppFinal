//
//  MovieModel.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel
-(instancetype)initwithContentOfDic:(NSDictionary *)dic
{
    self=[super init];
    if (self)
    {
        //获取数据
        self.scoreNum=[dic[@"subject"][@"rating"][@"average"]floatValue ];
        self.image_small=dic[@"subject"][@"images"][@"small"];
        self.image_medium=dic[@"subject"][@"images"][@"medium"];
        self.image_large=dic[@"subject"][@"images"][@"large"];
        self.title=dic[@"subject"][@"title"];
        self.subtype=dic[@"subject"][@"subtype"];
        self.year=dic[@"subject"][@"year"];
        self.original_title=dic[@"subject"][@"original_title"];
    }
    return self;
}
@end

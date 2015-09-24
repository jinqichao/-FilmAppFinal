//
//  PosterBodyCell.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "WXRatingView.h"
@interface PosterBodyCell : UICollectionViewCell
{
    UIImageView *_imageview;
    //子视图
    UIView *_detalView;
    //图片
    UIImageView *_dImageView;
    //标题
    UILabel *_titlelabel;
    //年份标题
    UILabel *_yearname;
    
    //年份
    UILabel *_yearlabel;
    //星星
    WXRatingView *_wxratingview;
    
    MovieModel *model;
    UILabel *_originallabel;
}
@property(strong,nonatomic)MovieModel *model;
@property(strong,nonatomic)UIView *baseView;
@property(strong,nonatomic)NSDictionary *datadic;
@property(assign,nonatomic)BOOL PicBool;
-(void)tapAction;
@end

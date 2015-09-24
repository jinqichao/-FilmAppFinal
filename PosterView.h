//
//  PosterView.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterBodyCollectionView.h"
#import "PostHeaderCollectionView.h"
@interface PosterView : UIView
{
    // 海报的内容视图
    PosterBodyCollectionView *_bodyCollectionView;
    PostHeaderCollectionView *_headerCollectionView;
    // 标题视图
    UILabel *_titleLabel;
    // 灯光视图
    UIImageView *_leftLightImageView;
    UIImageView *_rightLightImageView;
    // 半透明的遮罩视图
    UIView *_maskView;
    // 头视图
    UIImageView *_headerView;
    UIButton *_smallbutton;
    NSString *_titlename;
}
@property (nonatomic ,retain) NSArray *dataList;
//打开小视图的按钮



@end

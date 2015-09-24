//
//  WXRatingView.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXRatingView : UIView
{
    UIView *_grayView;
    UIView *_yellowView;
    UILabel *_scoreLabel;
}
@property(assign,nonatomic)float scoreNum;
@end

//
//  CinemaViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"
#import "DropDownList.h"
#import "DropDownListSecond.h"
@interface CinemaViewController : BaseViewController
//下拉控件
{
    DropDownList *_dropDownList;
    DropDownListSecond *_dropDownListSecond;
}
@property(strong,nonatomic)UIImageView *complaints;
@property(strong,nonatomic)UILabel *complaintlabel;

@property(strong,nonatomic)UIImageView *talk;
@property(strong,nonatomic)UILabel *talklabel;

@property(strong,nonatomic)UIImageView *LookFilm;
@property(strong,nonatomic)UILabel *lookFilmLabel;


@end

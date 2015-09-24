//
//  MyTabBarItem.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarItem : UIButton
{
    UIImageView *_myTitleImageView;
    UILabel *_myTitlelabel;
}
@property(copy,nonatomic)NSString *titleName;
@property(copy,nonatomic)NSString *imageName;
@end

//
//  PostHeaderCell.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/15.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
@interface PostHeaderCell : UICollectionViewCell
{
    UIImageView *_imageView;
}
@property(strong,nonatomic)MovieModel *model;
@end

//
//  FirstCollectionViewCell.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstCollectionViewCell : UICollectionViewCell
{
    UIImageView * _imageView;
}
//数据源
@property(nonatomic,retain) NSString * imageString;
@end

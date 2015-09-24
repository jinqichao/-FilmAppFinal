//
//  ListCell.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXRatingView.h"
@interface ListCell : UITableViewCell
{
    UIImageView *_titleImageView;
    UILabel *_titleLabel;
    UILabel *_yearLabel;
    WXRatingView *_wxratingview;
}
@property(nonatomic,retain)NSDictionary *dic;

@property(nonatomic,strong)NSMutableArray *titlearray;

@end

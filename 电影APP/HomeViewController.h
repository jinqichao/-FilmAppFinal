//
//  HomeViewController.h
//  电影APP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"
#import "ListTableView.h"
#import "PosterView.h"
#import "PosterBodyCollectionView.h"
@interface HomeViewController : BaseViewController
{
    PosterView *_posterView;
    ListTableView *_listTableView;
    PosterBodyCollectionView *_posterbodycollectionview;
}

@end

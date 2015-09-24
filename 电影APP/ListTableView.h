//
//  ListTableView.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
//表示图要实现的数据
@property(strong,nonatomic)NSArray *dataList;

@end

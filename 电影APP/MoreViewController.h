//
//  MoreViewController.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "BaseViewController.h"

@interface MoreViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UITableView *_tableview;
}
@end

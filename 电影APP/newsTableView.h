//
//  newsTableView.h
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newsTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
{
       UIButton *_albumbutton;
}
@property(strong,nonatomic)NSArray *datalist;

@property(strong,nonatomic)NSString *numberindex;
@property(assign,nonatomic)int indexpath;

@property(strong,nonatomic)NSString *titlepost;
@end

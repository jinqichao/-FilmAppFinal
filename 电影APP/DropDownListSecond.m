//
//  DropDownListSecond.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/19.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "DropDownListSecond.h"

@implementation DropDownListSecond
- (void)dealloc
{
    [tv release];
    [tableArray release];
    [super dealloc];
}

-(id)initWithFrame:(CGRect)frame
{
    
    self.indexpath1=0;
    if (frame.size.height<200) {
        frameHeight = 200;
    }else{
        frameHeight = frame.size.height;
    }
    tabheight = frameHeight-30;
    
    frame.size.height = 30.0f;
    
    self=[super initWithFrame:frame];
    
    if(self){
        showList = NO; //默认不显示下拉框
        
        tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, frame.size.width, 0)];
        tv.delegate = self;
        tv.dataSource = self;
        tv.backgroundColor = [UIColor whiteColor];
        tv.separatorColor = [UIColor lightGrayColor];
        tv.hidden = YES;
        [self addSubview:tv];
        
        self.FileArea=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.FileArea.frame=CGRectMake(15, 0, 180, 30);
        [self.FileArea addTarget:self action:@selector(dropdown) forControlEvents:UIControlEventTouchUpInside];
        [self.FileArea setTitle:@"影院地区" forState:UIControlStateNormal];
         [self.FileArea setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.FileArea.titleLabel.font=[UIFont systemFontOfSize:20];
        [self addSubview:self.FileArea];
        
        
        self.CityImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 340, 230)];
        self.CityImage.image=[UIImage imageNamed:@"影院城市图.jpg"];
        self.CityImage.backgroundColor= [UIColor yellowColor];
        [self addSubview:self.CityImage];
        
        
        UITapGestureRecognizer *uitap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dropdown)];
        self.CityImage.userInteractionEnabled=YES;
        [self.CityImage addGestureRecognizer:uitap];
        

        
        tv.separatorStyle=NO;
        
        
        
    }
    return self;
}
-(void)dropdown{
    
    if (showList) {//如果下拉框已显示，什么都不做
        tv.hidden=YES;
        showList=NO;
        self.CityImage.hidden=NO;
    }else {//如果下拉框尚未显示，则进行显示
        self.CityImage.hidden=YES;
        CGRect sf = self.frame;
        sf.size.height = frameHeight;
        
        //把dropdownList放到前面，防止下拉框被别的控件遮住
        [self.superview bringSubviewToFront:self];
        tv.hidden = NO;
        showList = YES;//显示下拉框
        
        CGRect frame = tv.frame;
        frame.size.height = 0;
        tv.frame = frame;
        frame.size.height = tabheight;
        [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        self.frame = sf;
        tv.frame = frame;
        [UIView commitAnimations];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 138;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
    }
  
      cell.backgroundColor=[UIColor blackColor];
    
//    self.FileNameDic=[WXDataSerivce getJSONDataWithFileName:@"cinema_list"];
//    NSMutableArray *array=[NSMutableArray arrayWithArray:self.FileNameDic[@"cinemaList"]];
//    tableArray=[NSMutableArray arrayWithCapacity:0];
//    
//    self.TotleSet=[NSMutableSet setWithCapacity:0];
//    
//    NSMutableDictionary *dict=[NSMutableDictionary dictionaryWithCapacity:0];
//    for (NSDictionary *dic in array)
//    {
//        [dict setDictionary:dic];
//        for (NSString *str in dict)
//        {
//            str=dict[@"address"];
//            [self.TotleSet addObject:str];
//        }
//    }
//    for (NSString *st in self.TotleSet)
//    {
//        [tableArray addObject:st];
//    }
    
    self.FileNameDic=[WXDataSerivce getJSONDataWithFileName:@"cinema_list"];
    self.AllArray=[NSMutableArray arrayWithCapacity:0];
    
    
    self.AllArray=[NSMutableArray arrayWithArray:self.FileNameDic[@"cinemaList"]];
    cell.textLabel.text=self.AllArray[indexPath.row][@"address"];

    
    
 
    cell.textLabel.textColor=[UIColor whiteColor];
    
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.TitleForFilm=self.FileNameDic[@"cinemaList"][indexPath.row][@"name"];
    
    
    if ([self.FileNameDic[@"cinemaList"][indexPath.row][@"lowPrice"] isEqual:[NSNull null]])
    {
        self.LowPrice=0.0;
    }
    else
    {
        self.LowPrice=[self.FileNameDic[@"cinemaList"][indexPath.row][@"lowPrice"] floatValue];
    }
    
    if ([self.FileNameDic[@"cinemaList"][indexPath.row][@"tel"]isEqual:[NSNull null]] )
    {
        self.telePhone=@"暂无";
    }
    else
    {
        self.telePhone=self.FileNameDic[@"cinemaList"][indexPath.row][@"tel"];
    }
    
    if ([self.FileNameDic[@"cinemaList"][indexPath.row][@"grade"] isEqual:[NSNull null]])
    {
        self.ScoreNum=5;
    }else
    {
        
        self.ScoreNum=[self.FileNameDic[@"cinemaList"][indexPath.row][@"grade"]floatValue];
    }
    
    if ([self.FileNameDic[@"cinemaList"][indexPath.row][@"id"] isEqual:[NSNull null]])
    {
        self.IDforFilm=@"暂无";
    }
    else
    {
        self.IDforFilm=self.FileNameDic[@"cinemaList"][indexPath.row][@"id"];
    }
    
    if ([self.FileNameDic[@"cinemaList"][indexPath.row][@"circleName"] isEqual:[NSNull null]])
    {
        self.Street=@"暂无";
    }
    else
    {
        self.Street=self.FileNameDic[@"cinemaList"][indexPath.row][@"circleName"];
    }
    self.indexpath1++;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

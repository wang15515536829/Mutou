//
//  MessageView.m
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import "MessageView.h"



@implementation MessageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews
{
    
    
    self.backgroundColor = [UIColor orangeColor];
    // 创建ScrollView （这个起点坐标系统默认导航条下方的点为0）（tableView）
    self.myscrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, self.frame.size.height)];
    
    
    
    // 创建一个Tableview
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor orangeColor];
    // atableView的代理对象
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.myscrollView addSubview:self.tableView];
    [self.tableView release];
    
    
    
    
    
    // 创建 Competition
    self.competition = [[Competition alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height - 30)];
    [self.myscrollView addSubview:self.competition];
    
    
    
    // 创建 Vieo
    self.video = [[Video alloc] initWithFrame:CGRectMake(2 * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height - 30)];
    self.video.backgroundColor = [UIColor redColor];
    [self.myscrollView addSubview:self.video];
    
    
    // 创建 Recreation
    self.recreation = [[Recreation alloc] initWithFrame:CGRectMake(self.frame.size.width * 3, 0, self.frame.size.width, self.frame.size.height - 30)];
    self.recreation.backgroundColor = [UIColor purpleColor];
    [self.myscrollView addSubview:self.recreation];
    
    
    
    // 给ScrollView设置Content
    self.myscrollView.contentSize = CGSizeMake(self.frame.size.width * 4, 0);
    // ScrollView滑动条关闭
    self.myscrollView.showsHorizontalScrollIndicator = NO;
    
    // 设置ScrollView不要弹簧效果
    self.myscrollView.bounces = NO;
    
    // ScrollView可以整页翻动
    self.myscrollView.pagingEnabled = YES;
    
    // scrollView的代理对象
    self.myscrollView.delegate = self;
    
    // 添加和 释放
    [self addSubview:self.myscrollView];
    [self.myscrollView release];
    
    
}

#pragma  mark - TableView的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    cell.textLabel.text = @"测试";
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *uiview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    // 创建滑动条的ScrollView （滑动条 ）
    UIScrollView *SliderScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
    // 给ScrollView设置Content
    SliderScrollView.contentSize = CGSizeMake(self.frame.size.width * 3, 200);
    // ScrollView滑动条关闭
    SliderScrollView.showsHorizontalScrollIndicator = NO;
    
    // 设置ScrollView不要弹簧效果
    SliderScrollView.bounces = NO;
    
    // ScrollView可以整页翻动
    SliderScrollView.pagingEnabled = YES;
    SliderScrollView.delegate = self;
    
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
    vi.backgroundColor = [UIColor purpleColor];
    [SliderScrollView addSubview:vi];
    
    // 滑动条
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, 200)];
    view.backgroundColor = [UIColor redColor];
    [SliderScrollView addSubview:view];
    
    
    
    
    [uiview addSubview:SliderScrollView];
    return uiview;
    
    
}











/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
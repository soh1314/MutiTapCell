//
//  MultiTabCell.m
//  test
//
//  Created by 刘仰清 on 16/8/8.
//  Copyright © 2016年 刘仰清. All rights reserved.
//

#import "MultiTabCell.h"

@implementation MultiTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self defaultParameter];
        [self initUI];
    }
    return self;
}

#pragma mark -- UI
- (void)initUI
{
    CGRect rect = self.bounds;
    rect.size.width = [UIScreen mainScreen].bounds.size.width ;
    self.bounds = rect;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    MutiTabBar * tabBar = [[MutiTabBar alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width,50) titleArray:@[@"真的罪恶",@"无耻人生",@"我肚子饿了"]];
    tabBar.delegate = self;
    [self addSubview:tabBar];
    [self addSubview:self.content];
    
}
#pragma mark -- initial parameter
- (void)defaultParameter
{
    self.selectIndex = 0;
    self.cellHeigth = 500;
}
#pragma mark -- set method
- (void)setCellHeigth:(CGFloat)cellHeigth
{
    _cellHeigth = cellHeigth;
    [self.content reloadData];
}
#pragma mark -- lazy load
- (UITableView *)content
{
    if (!_content) {
        _content = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, self.cellHeigth-50) style:UITableViewStylePlain];
        _content.dataSource = self;
        _content.delegate = self;
        _content.tableFooterView = [[UIView alloc]init];
        _content.showsVerticalScrollIndicator = NO;
        _content.bounces = NO;
        [_content registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCellID"];
    }
    return _content;
}

#pragma  mark -- tableView delegate and dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCellID" forIndexPath:indexPath];

    if (self.selectIndex == 0) {
    
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.selectIndex == 0) {
        return 2;
    }
    else if (self.selectIndex == 1){
        return 3;
    }
    else
    {
        return 4;
    }
}
#pragma mark -- multiTabBar delegate
- (void)multiTabBar:(MutiTabBar *)tabBar selectTabWithIndex:(NSInteger)index
{
    self.selectIndex = index;
    [self.content reloadData];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

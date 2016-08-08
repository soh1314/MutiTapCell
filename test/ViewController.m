//
//  ViewController.m
//  test
//
//  Created by 刘仰清 on 16/8/8.
//  Copyright © 2016年 刘仰清. All rights reserved.
//

#import "ViewController.h"
#import "MultiTabCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, assign)BOOL change;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self performSelector:@selector(changeViewHeight) withObject:self afterDelay:2];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)changeViewHeight
{
    self.change = YES;
    [self.tableView reloadData];
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MultiTabCell class] forCellReuseIdentifier:@"MultiTabCellID"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCellID"];
    }
    return _tableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MultiTabCell * tabCell = [tableView dequeueReusableCellWithIdentifier:@"MultiTabCellID" forIndexPath:indexPath];
        tabCell.cellHeigth = self.change ? 500 : 300;
        return tabCell;
    }
    else
    {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCellID" forIndexPath:indexPath];
        cell.textLabel.text = @"what a gp";
        return cell;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
       
        return self.change ? 500 : 350;
    }
    else
    {
        return 50;
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else
    {
        return 5;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

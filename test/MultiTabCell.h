//
//  MultiTabCell.h
//  test
//
//  Created by 刘仰清 on 16/8/8.
//  Copyright © 2016年 刘仰清. All rights reserved.
//
/*
 思路 控制器中数据源动态控制cell高度,代理方法选中不同tab时候cell的样式不同;
 */
#import <UIKit/UIKit.h>
#import "MutiTabBar.h"
@class MultiTabCell;
@protocol MultiTabCellDelegate <NSObject>



@end
@interface MultiTabCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource,MutiTabBarDelegate>

@property (nonatomic, strong)UITableView * content;
@property (nonatomic, strong)UIView * tabView;
@property (nonatomic, assign)NSInteger count;
@property (nonatomic, assign)NSInteger selectIndex;
@property (nonatomic, assign)CGFloat cellHeigth;


@end

//
//  MutiTabBar.h
//  test
//
//  Created by 刘仰清 on 16/8/8.
//  Copyright © 2016年 刘仰清. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MutiTabBar;
@protocol MutiTabBarDelegate <NSObject>

- (void)multiTabBar:(MutiTabBar *)tabBar selectTabWithIndex:(NSInteger)index;

@end
@interface MutiTabBar : UIView

@property (nonatomic, strong)UIView * tabBarBg;
@property (nonatomic, copy)NSArray * titleArray;
@property (nonatomic, assign)NSInteger count;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)NSInteger currentIndex;
@property (nonatomic, strong)UIFont * font;
@property (nonatomic, weak)id <MutiTabBarDelegate>delegate;

- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;
@end

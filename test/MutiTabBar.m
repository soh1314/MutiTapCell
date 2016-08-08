//
//  MutiTabBar.m
//  test
//
//  Created by 刘仰清 on 16/8/8.
//  Copyright © 2016年 刘仰清. All rights reserved.
//

#import "MutiTabBar.h"
@interface MutiTabBar()
@property (nonatomic, strong)NSMutableArray * tabBarButtonArray;
@property (nonatomic, strong)UIView * selectedLine;
@end
@implementation MutiTabBar
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self defaultParameterSet];
        [self initUI];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray
{
    if (self = [super initWithFrame:frame]) {
        self.titleArray = titleArray;
        [self defaultParameterSet];
        [self initUI];
    }
    return self;
}
- (void)defaultParameterSet
{
    if (self.titleArray && self.titleArray.count > 0) {
        self.count = self.titleArray.count;
    }
    else
    {
    self.count = 3;
    }
    self.height = 50;
    self.currentIndex = 0;
}
- (void)initUI
{
    CGFloat width = self.bounds.size.width/self.count;
    
    self.tabBarBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 50)];
    [self addSubview:self.tabBarBg];
    // btn
    for (int i = 0; i <self.count; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(i * width,0, width,50)];
        NSString * text = [self.titleArray objectAtIndex:i];
        [btn setTitle:text forState:UIControlStateNormal];
        btn.tag = i+10000;
        [btn setTitle:text forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(tapTapBarBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = self.font;
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.tabBarBg addSubview:btn];
        [self.tabBarButtonArray addObject:btn];
    }
    // line
    [self addSubview:self.selectedLine];
    CGSize textSize = [self textSizeAtIndex:0];
    self.selectedLine.frame = CGRectMake(0, self.height-2, textSize.width, 2);
    UIButton * btn = self.tabBarButtonArray[0];
    self.selectedLine.center = CGPointMake(btn.center.x, self.selectedLine.center.y);
}

- (void)layoutSubviews
{
    self.tabBarBg.frame = CGRectMake(0, 0, self.bounds.size.width, self.height);
    
}
#pragma mark set get
- (NSMutableArray *)tabBarButtonArray
{
    if (!_tabBarButtonArray) {
        NSInteger capacity = self.count?self.count:1;
        _tabBarButtonArray = [NSMutableArray arrayWithCapacity:capacity];
    }
    return _tabBarButtonArray;
}
- (UIFont *)font
{
    if (!_font) {
        _font = [UIFont systemFontOfSize:14];
    }
    return _font;
}
- (UIView *)selectedLine {
    if (!_selectedLine) {
        self.selectedLine = [[UIView alloc] init];
        _selectedLine.backgroundColor = [UIColor redColor];
    }
    return _selectedLine;
}
- (CGSize)textSizeAtIndex:(NSInteger)index
{
    CGSize size = CGSizeZero;
    size = [self.titleArray[index] sizeWithAttributes:@{NSFontAttributeName: self.font}];
    return size;
}

- (void)setHeight:(CGFloat)height
{
    _height = height;
    [self layoutIfNeeded];
}
- (void)layoutButtonFrame
{
    
}

- (void)tapTapBarBtn:(id)sender
{
    UIButton * btn = sender;
    NSInteger index = btn.tag - 10000;
    if (self.currentIndex != index) {
        self.currentIndex = btn.tag - 10000;
        [self moveLineTo:self.currentIndex animate:YES];
        [self changeButtonSelectStatus];
        if (self.delegate && [self.delegate respondsToSelector:@selector(multiTabBar:selectTabWithIndex:)]) {
            [self.delegate multiTabBar:self selectTabWithIndex:self.currentIndex];
        }
    }
}
- (void)moveLineTo:(NSInteger)index animate:(BOOL)animate
{
    UIButton *currentButton = self.tabBarButtonArray[index];
    void(^moveSelectedLine)(void) = ^(void) {
        self.selectedLine.center = CGPointMake(currentButton.center.x, self.selectedLine.center.y);
    };
    if (animate) {
        [UIView animateWithDuration:0.3 animations:^{
            moveSelectedLine();
        }];
    } else {
        moveSelectedLine();
    }
}
- (void)changeButtonSelectStatus
{
    
}
- (void)tapTabBar:(UITapGestureRecognizer *)tap
{
    UIView * tapView = tap.view;
    NSLog(@"%lu",tapView.tag);
}
@end

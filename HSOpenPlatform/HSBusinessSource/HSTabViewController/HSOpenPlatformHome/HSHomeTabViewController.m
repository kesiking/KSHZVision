//
//  EHHomeTabbarViewController.m
//  eHome
//
//  Created by 孟希羲 on 15/6/4.
//  Copyright (c) 2015年 com.cmcc. All rights reserved.
//

#import "HSHomeTabViewController.h"
#import "WeAppLoadingView.h"
#import "HSHomeCircleChartView.h"

#define kHSHomeHeaderViewHeight     (caculateNumber(31.0))

@interface HSHomeTabViewController()
{
}

@property(nonatomic, strong) CSLinearLayoutView*    linearLayoutView;

@property(nonatomic, strong) HSHomeCircleChartView* circleChartView;

@end

@implementation HSHomeTabViewController
//////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - init method
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    self.view.backgroundColor = EH_bgcor1;
    [self initBasicNavBarViews];
    [self initlLinearLayoutView];
}


-(void)initBasicNavBarViews{
    
}

-(void)initlLinearLayoutView{
    [self.view addSubview:self.linearLayoutView];
    [self reloadLinearLayoutView];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - 刷新垂直布局 reloadLinearLayoutView
-(void)reloadLinearLayoutView{
    [self.linearLayoutView removeAllItems];
    
    CGPoint containerOffset          = self.linearLayoutView.contentOffset;
    CSLinearLayoutItemPadding padding = CSLinearLayoutMakePadding(0, 0, 0, 0);
    
    CSLinearLayoutItem *circleChartViewItem = [[CSLinearLayoutItem alloc] initWithView:self.circleChartView];
    circleChartViewItem.padding = padding;
    [self.linearLayoutView addItem:circleChartViewItem];
    
    /*调整布局*/
    if (self.linearLayoutView.contentSize.height > self.linearLayoutView.height) {
        [self.linearLayoutView setContentOffset:containerOffset];
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - 右键bar 消息响应 messageBtnClicked



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - override method refreshDataRequest 刷新数据
-(void)refreshDataRequest{
    
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(void)viewDidUnload{
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - 懒加载 method
- (CSLinearLayoutView *)linearLayoutView {
    if (!_linearLayoutView) {
        _linearLayoutView = [[CSLinearLayoutView alloc] initWithFrame:self.view.bounds];
    }
    return _linearLayoutView;
}

-(HSHomeCircleChartView *)circleChartView{
    if (_circleChartView == nil) {
        _circleChartView = [[HSHomeCircleChartView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
    }
    return _circleChartView;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - bannerView method

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - 登录相关操作

-(void)userDidLogin:(NSDictionary*)userInfo{
    [super userDidLogin:userInfo];
}

-(void)userDidLogout:(NSDictionary*)userInfo{
    [super userDidLogout:userInfo];
}

@end

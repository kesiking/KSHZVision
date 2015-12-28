//
//  EHHomeTabbarViewController.m
//  eHome
//
//  Created by 孟希羲 on 15/6/4.
//  Copyright (c) 2015年 com.cmcc. All rights reserved.
//

#import "HSHomeTabViewController.h"
#import "WeAppLoadingView.h"

#define kHSHomeHeaderViewHeight     (caculateNumber(31.0))

@interface HSHomeTabViewController()<UITableViewDataSource, UITableViewDelegate>
{
}

@property(nonatomic, strong) UITableView*           tableView;

@property(nonatomic, strong) WeAppLoadingView*      refreshPageLoadingView;

@end

@implementation HSHomeTabViewController
//////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - init method
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    self.view.backgroundColor = EH_bgcor1;
    [self.view addSubview:self.tableView];
    
    [self initBasicNavBarViews];
}


-(void)initBasicNavBarViews{
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self releaseTableView];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - 右键bar 消息响应 messageBtnClicked

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = EHCor1;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return caculateNumber(15);
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}


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
#pragma mark - tableView method
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        [self configPullToRefresh];
    }
    return _tableView;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark tableView config

-(void)configPullToRefresh{
    //刷新逻辑
    if (_tableView && [_tableView isKindOfClass:[UITableView class]]) {
        WEAKSELF
        [_tableView addPullToRefreshWithActionHandler:^{
            STRONGSELF
            
            int64_t delayInSeconds = 2.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                if ([strongSelf.tableView showsPullToRefresh]) {
                    //判断是否已经被取消刷新，避免出现crash
                    [strongSelf refreshDataRequest];
                    [strongSelf.tableView.pullToRefreshView stopAnimating];
                }
            });
        }];
        [self configPullToRefreshViewStatus:_tableView];
    }
    
}

-(void)configPullToRefreshViewStatus:(UIScrollView *)scrollView{
    [scrollView.pullToRefreshView setTitle:@"" forState:SVInfiniteScrollingStateAll];
    [scrollView.pullToRefreshView setCustomView:self.refreshPageLoadingView forState:SVInfiniteScrollingStateAll];
    [self.refreshPageLoadingView startAnimating];
}

-(void)releasePullToRefreshView{
    [_tableView setShowsPullToRefresh:NO];
    _tableView.delegate = nil;
    _tableView = nil;
}

-(void)releaseTableView{
    if ([NSThread isMainThread])
    {
        [self releasePullToRefreshView];
    }else{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self releasePullToRefreshView];
        });
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark loadingView method

-(WeAppLoadingView *)refreshPageLoadingView{
    if (_refreshPageLoadingView == nil) {
        _refreshPageLoadingView = [[WeAppLoadingView alloc]initWithFrame:CGRectMake(0, 0, 28, 28)];
        _refreshPageLoadingView.loadingView.circleColor = [UIColor blackColor];
        _refreshPageLoadingView.loadingViewType = WeAppLoadingViewTypeCircel;
    }
    return _refreshPageLoadingView;
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

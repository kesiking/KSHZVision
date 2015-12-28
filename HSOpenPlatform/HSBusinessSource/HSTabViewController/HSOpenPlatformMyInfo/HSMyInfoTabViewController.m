//
//  EHMyInfoTabbarViewController.m
//  eHome
//
//  Created by 孟希羲 on 15/6/4.
//  Copyright (c) 2015年 com.cmcc. All rights reserved.
//

#import "HSMyInfoTabViewController.h"

@interface HSMyInfoTabViewController()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;


@end

@implementation HSMyInfoTabViewController

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.needLogin = YES;
    self.title = @"我的";
    [self.view addSubview:self.tableView];
}

- (void)initMyInfoSettingItemList
{
   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UMSocialUIDelegate
//实现回调方法（可选）：
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        EHLogInfo(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
        [WeAppToast toast:@"分享成功！"];
    }
    else {
        [WeAppToast toast:@"分享失败！"];
    }
    
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark- KSTabBarViewControllerProtocol

-(BOOL)shouldSelectViewController:(UIViewController*)viewController{
    return [self checkLogin];
}

- (CGRect)selectViewControllerRectForBounds:(CGRect)bounds{
    return CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 49);
}

@end

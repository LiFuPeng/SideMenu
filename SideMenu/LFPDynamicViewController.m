//
//  LFPDynamicViewController.m
//  仿手机QQ的侧拉菜单
//
//  Created by 蜗牛 on 16/9/2.
//  Copyright © 2016年 关于蜗牛：一枚九零后码农  蜗牛-----QQ:3197857495-----李富棚  个人微信：woniu1308822159  微信公众号：woniuxueios  简书：蜗牛学IOS  地址：http://www.jianshu.com/users/a664a9fcb096/latest_articles  简书专题：蜗牛学IOS  地址：http://www.jianshu.com/collection/bfcf49bf5d27    蜗牛     */. All rights reserved.
//

#import "LFPDynamicViewController.h"

#import "LFPAppEngineManager.h"
#import "LFPAppBaseViewController.h"

@interface LFPDynamicViewController ()

@end

@implementation LFPDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动态";
    
    self.view.backgroundColor =[UIColor whiteColor];
    UIButton *leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame=CGRectMake(0, 0, 30, 30);
    [leftButton setImage:[UIImage imageNamed:@"me.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(home) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem=leftBarButtonItem;

}

- (void)home{
    
    NSLog(@"leftBtnClicked");
    [[LFPAppEngineManager sharedInstance].baseViewController leftControllerAppear];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

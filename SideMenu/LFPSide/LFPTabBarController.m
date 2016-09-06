//
//  LFPTabBarController.m
//  仿手机QQ的侧拉菜单
//
//  Created by 蜗牛 on 16/9/2.
//  Copyright © 2016年 关于蜗牛：一枚九零后码农  蜗牛-----QQ:3197857495-----李富棚  个人微信：woniu1308822159  微信公众号：woniuxueios  简书：蜗牛学IOS  地址：http://www.jianshu.com/users/a664a9fcb096/latest_articles  简书专题：蜗牛学IOS  地址：http://www.jianshu.com/collection/bfcf49bf5d27    蜗牛     */. All rights reserved.
//

#import "LFPTabBarController.h"

#import "LFPLeftViewController.h"
#import "LFPAppEngineManager.h"

#import "LFPMessageViewController.h"
#import "LFPContactViewController.h"
#import "LFPDynamicViewController.h"

@interface LFPTabBarController ()

@end

@implementation LFPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewControllers];
    
    [self setTabBarItems];
}

-(void)setViewControllers{
    
    LFPMessageViewController *mvc=[[LFPMessageViewController alloc]init];
    UINavigationController *mnc=[[UINavigationController alloc]initWithRootViewController:mvc];
    
    LFPContactViewController *cvc=[[LFPContactViewController alloc]init];
    UINavigationController *cnc=[[UINavigationController alloc]initWithRootViewController:cvc];
    
    LFPDynamicViewController *dvc=[[LFPDynamicViewController alloc]init];
    UINavigationController *dnc=[[UINavigationController alloc]initWithRootViewController:dvc];
    
    mnc.navigationBar.barTintColor=[UIColor colorWithRed:126/255.0 green:85/255.0 blue:72/255.0 alpha:1.0];;
    
    cnc.navigationBar.barTintColor=[UIColor colorWithRed:126/255.0 green:85/255.0 blue:72/255.0 alpha:1.0];;
    
    dnc.navigationBar.barTintColor=[UIColor colorWithRed:126/255.0 green:85/255.0 blue:72/255.0 alpha:1.0];;
    
    mnc.navigationBar.tintColor = [UIColor whiteColor];
    cnc.navigationBar.tintColor = [UIColor whiteColor];
    dnc.navigationBar.tintColor = [UIColor whiteColor];
    
    self.viewControllers = @[mnc,cnc,dnc];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
    backView.backgroundColor =[UIColor colorWithRed:126/255.0 green:85/255.0 blue:72/255.0 alpha:1.0];
//    RGBColor(126, 85, 72);
    
    
    [self.tabBar insertSubview:backView atIndex:0];


}


-(void)setTabBarItems{
    
    NSArray *titleArray=@[@"消息",@"联系人",@"动态"];
    NSArray *normalImageArrar=@[@"me.png",@"me.png",@"me.png"];
    NSArray *selectedImageArrar=@[@"me.png",@"me.png",@"me.png"];
    
    for (int i=0; i<3; i++) {
        
        UIViewController *vc = self.viewControllers[i];
        vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:titleArray[i] image:[UIImage imageNamed:normalImageArrar[i]] selectedImage:[[UIImage imageNamed:selectedImageArrar[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
        vc.tabBarItem.tag = i;
    }
    
    [[UITabBarItem appearance]setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];


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

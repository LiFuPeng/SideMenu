//
//  LFPAppBaseViewController.m
//  仿手机QQ的侧拉菜单
//
//  Created by 蜗牛 on 16/9/2.
//  Copyright © 2016年 关于蜗牛：一枚九零后码农  蜗牛-----QQ:3197857495-----李富棚  个人微信：woniu1308822159  微信公众号：woniuxueios  简书：蜗牛学IOS  地址：http://www.jianshu.com/users/a664a9fcb096/latest_articles  简书专题：蜗牛学IOS  地址：http://www.jianshu.com/collection/bfcf49bf5d27    蜗牛     */. All rights reserved.
//

#import "LFPAppBaseViewController.h"

#import "LFPLeftViewController.h"
#import "LFPAppEngineManager.h"
#import "LFPTabBarController.h"

@interface LFPAppBaseViewController (){
    
    UIImageView     *backgroundIV;
    UIView          *blackCover;
    UIView          *baseView;
    CGFloat          displacementOfLeftViewController;
    CGPoint          centerOfLeftViewAtBeginning;
    CGPoint          centerOfBaseViewController;
    CGFloat          realDistance;


}

@end

@implementation LFPAppBaseViewController


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
    [LFPAppEngineManager sharedInstance].TabBarController.tabBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initControllers];
    
    //初始化背景的图片和黑色遮盖层
    [self configBackgroundElement];
}

- (void)initControllers{
    
    _leftViewController   = [[LFPLeftViewController alloc]init];
    _TabBarController = [LFPAppEngineManager sharedInstance].TabBarController;
    
}

- (void)configBackgroundElement {
    
    //注意添加覆盖的顺序
    backgroundIV = [[UIImageView alloc]init];
    backgroundIV.image = [UIImage imageNamed:@"WeakUp.jpg"];
    backgroundIV.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:backgroundIV];
    
    //动画初始参数
    centerOfLeftViewAtBeginning = _leftViewController.view.center;
    centerOfBaseViewController  = self.view.center;
    //把侧滑菜单加入跟控制器
    [self.view addSubview:_leftViewController.view];
    
    blackCover = [[UIView alloc]initWithFrame:CGRectOffset(self.view.frame, 0, 0)];
    blackCover.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackCover];
    
    baseView = [[UIView alloc]initWithFrame:self.view.frame];
    baseView =_TabBarController.view;
    [self.view addSubview:baseView];
    
    self.panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gestureOnBaseVC:)];
    [baseView addGestureRecognizer:self.panGesture];
    
    self.tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(homeControllerAppear)];
    
}



//-----------------------------------------------------------

//左边的控制器
- (void)leftControllerAppear{
    //
    [baseView addGestureRecognizer:self.tapGesture];
    //在这里提前刷洗防止tableView留下上次选中的状态
    [_leftViewController.listTableView reloadData];
    displacementOfLeftViewController = centerOfBaseViewController.x + [UIScreen mainScreen].bounds.size.width - [UIScreen mainScreen].bounds.size.width / 3;;
    [self doAnimationWithType:@"left"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)homeControllerAppear{
    
    [baseView removeGestureRecognizer:self.tapGesture];
    displacementOfLeftViewController = self.view.center.x;
    [self doAnimationWithType:@"home"];
    
    
}

- (void)rightControllerAppear{
    
    //    [mainView addGestureRecognizer:self.tapGesture];
    //    [self doAnimationWithType:@"right"];
}

//处理动画啊
- (void)doAnimationWithType:(NSString *)type {
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        baseView.center = CGPointMake(displacementOfLeftViewController, self.view.center.y);
        
        if ([type isEqualToString:@"left"]) {
            
            _leftViewController.view.center = CGPointMake(centerOfLeftViewAtBeginning.x + displacementOfLeftViewController - self.view.center.x, centerOfLeftViewAtBeginning.y);
        }
        
        
        if ([type isEqualToString:@"home"]) {
            
            _leftViewController.view.center = CGPointMake(centerOfLeftViewAtBeginning.x , centerOfLeftViewAtBeginning.y);
        }
        
        blackCover.alpha = [type isEqualToString:@"home"]? 1 : 0;
        
        
    }];
    
}

//-----------------------------------------------------------
- (void)gestureOnBaseVC:(UIPanGestureRecognizer *)recognizer {
    
    realDistance = [recognizer translationInView:self.view].x;
    
    //结束时，自动激活停靠动作
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        if (realDistance > [UIScreen mainScreen].bounds.size.width / 3) {
            
            [self leftControllerAppear];
            
            
        }else if (realDistance < [UIScreen mainScreen].bounds.size.width * -(1/ 3)){
            
            //这个页面未做
            [self rightControllerAppear];
            
        }else {
            
            [self homeControllerAppear];
        }
        
        return; //这是需要return，因为停止状态了;
    }
    
    
    
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

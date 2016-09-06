//
//  LFPAppEngineManager.m
//  仿手机QQ的侧拉菜单
//
//  Created by 蜗牛 on 16/9/1.
//  Copyright © 2016年 关于蜗牛：一枚九零后码农  蜗牛-----QQ:3197857495-----李富棚  个人微信：woniu1308822159  微信公众号：woniuxueios  简书：蜗牛学IOS  地址：http://www.jianshu.com/users/a664a9fcb096/latest_articles  简书专题：蜗牛学IOS  地址：http://www.jianshu.com/collection/bfcf49bf5d27    蜗牛     */. All rights reserved.
//

#import "LFPAppEngineManager.h"
#import "LFPAppBaseViewController.h"
#import "LFPTabBarController.h"

static  LFPAppEngineManager *sharesElement = nil;

@implementation LFPAppEngineManager


+ (instancetype)sharedInstance {
    
    @synchronized(self) {
        
        if (sharesElement == nil) {
            
            sharesElement = [[self alloc]init];
        }
    }
    
    return sharesElement;
}

+(id)allocWithZone:(struct _NSZone *)zone {
    
    @synchronized(self) {
        
        if (sharesElement == nil) {
            
            sharesElement = [super allocWithZone:zone];
            return  sharesElement;
        }
        
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    
    return self;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.baseViewController = [[LFPAppBaseViewController alloc]init];
        
        self.baseNavController = [[UINavigationController alloc]initWithRootViewController:self.baseViewController];
        
        self.TabBarController = [[LFPTabBarController alloc]init];
        
        
        NSLog(@"BaseViewController%@",self.baseViewController);
        NSLog(@"BaseViewControllerNavC%@",self.baseNavController);
        NSLog(@"MainTBC%@",self.TabBarController);
    }
    return self;
}


@end

//
//  LFPLeftViewController.m
//  仿手机QQ的侧拉菜单
//
//  Created by 蜗牛 on 16/9/2.
//  Copyright © 2016年 关于蜗牛：一枚九零后码农  蜗牛-----QQ:3197857495-----李富棚  个人微信：woniu1308822159  微信公众号：woniuxueios  简书：蜗牛学IOS  地址：http://www.jianshu.com/users/a664a9fcb096/latest_articles  简书专题：蜗牛学IOS  地址：http://www.jianshu.com/collection/bfcf49bf5d27    蜗牛     */. All rights reserved.
//

#import "LFPLeftViewController.h"

#import "leftViewCell.h"

#import "LFPViewController.h"

#import "LFPAppBaseViewController.h"
#import "LFPAppEngineManager.h"

@interface LFPLeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray * titleArray;

@end

@implementation LFPLeftViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArray=@[@{@"title":@"开通会员",@"image":@"me.png"},@{@"title":@"QQ钱包",@"image":@"me.png"},@{@"title":@"个性装扮",@"image":@"me.png"},@{@"title":@"我的收藏",@"image":@"me.png"},@{@"title":@"我的相册",@"image":@"me.png"},@{@"title":@"我的文件",@"image":@"me.png"},@{@"title":@"我的名片夹",@"image":@"me.png"}];
    
    _listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100,self.view.frame.size.width, self.view.frame.size.height-100) style:UITableViewStylePlain];
    _listTableView.backgroundColor=[UIColor blueColor];
    _listTableView.dataSource = self;
    _listTableView.delegate = self;
    [self.view addSubview:_listTableView];
    self.view.frame = CGRectMake(-(self.view.frame.size.width - self.view.frame.size.width / 3), 0, self.view.frame.size.width - self.view.frame.size.width / 3, [UIScreen mainScreen].bounds.size.height);
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _titleArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 35;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identifier = @"cell";
    
    leftViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[leftViewCell alloc]initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:identifier];
    }
    NSDictionary *dic=_titleArray[indexPath.row];
    [cell setDic:dic];
    
    cell.backgroundColor=[UIColor cyanColor];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic=_titleArray[indexPath.row];
    LFPAppBaseViewController *baseVC = [LFPAppEngineManager sharedInstance].baseViewController;
    [baseVC homeControllerAppear];
    
    LFPViewController *vc=[[LFPViewController alloc]init];
    vc.titleName=[dic objectForKey:@"title"];
    [baseVC.navigationController pushViewController:vc animated:YES];

}


@end

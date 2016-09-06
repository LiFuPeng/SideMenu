//
//  leftViewCell.m
//  SideMenu
//
//  Created by 蜗牛 on 16/9/6.
//  Copyright © 2016年 关于蜗牛：一枚九零后码农  蜗牛-----QQ:3197857495-----李富棚  个人微信：woniu1308822159  微信公众号：woniuxueios  简书：蜗牛学IOS  地址：http://www.jianshu.com/users/a664a9fcb096/latest_articles  简书专题：蜗牛学IOS  地址：http://www.jianshu.com/collection/bfcf49bf5d27    蜗牛     */. All rights reserved.
//

#import "leftViewCell.h"

#import "ZXPAutoLayout.h"

@interface leftViewCell ()

@property (nonatomic,strong) UIImageView * ImageView;
@property (nonatomic,strong) UILabel * titleLabel;



@end

@implementation leftViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
        _ImageView=[UIImageView new];
        [self.contentView addSubview:_ImageView];
        _ImageView.contentMode=UIViewContentModeScaleAspectFit;
        [_ImageView zxp_addConstraints:^(ZXPAutoLayoutMaker *layout){
            
            layout.topSpace(2.5f);
            layout.leftSpace(10);
            layout.bottomSpace(2.5f);
            layout.widthValue(30);
        
        }];
        
        
        _titleLabel=[UILabel new];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel zxp_addConstraints:^(ZXPAutoLayoutMaker *layout){
            layout.leftSpaceByView(_ImageView,10);
            layout.topSpace(0);
            layout.bottomSpace(0);
            layout.rightSpace(20);
        
        }];
        
        
    }
    return self;
}

-(void)setDic:(NSDictionary *)dic{
    
    _ImageView.image=[UIImage imageNamed:[dic objectForKey:@"image"]];
    _titleLabel.text=[dic objectForKey:@"title"];
    

}







@end

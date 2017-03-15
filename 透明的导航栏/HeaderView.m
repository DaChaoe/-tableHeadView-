//
//  HeaderView.m
//  透明的导航栏
//
//  Created by 李增超 on 2017/3/15.
//  Copyright © 2017年 李增超. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        self.headImage.layer.cornerRadius = 15.0;
        self.headImage.layer.masksToBounds = YES;
        self.headImage.backgroundColor = [UIColor redColor];
        [self addSubview:self.headImage];
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 60, 30)];
        self.name.backgroundColor = [UIColor clearColor];
        self.name.text = @"李增超";
        self.name.textColor = [UIColor blackColor];
        [self addSubview:self.name];
    }
    return self;
}
-(void)setAlpha:(CGFloat)alpha
{
    self.headImage.alpha = alpha;
    self.name.alpha = alpha;
}
@end

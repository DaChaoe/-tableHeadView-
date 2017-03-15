//
//  HeaderView.h
//  透明的导航栏
//
//  Created by 李增超 on 2017/3/15.
//  Copyright © 2017年 李增超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView
//设置标题的透明度
@property (nonatomic)CGFloat alpha;
@property (nonatomic,strong)UIImageView *headImage;
@property (nonatomic,strong)UILabel *name;
@end

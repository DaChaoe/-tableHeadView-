//
//  ViewController.m
//  透明的导航栏
//
//  Created by 李增超 on 2017/3/15.
//  Copyright © 2017年 李增超. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"

#define ALPHAColor(a) [UIColor colorWithRed:246.0/255 green:246.0/255 blue:246.0/255 alpha:a];
@interface ViewController ()
@property (nonatomic,strong)HeaderView *headView;
@property (nonatomic,strong)UIView *status;
@property (nonatomic,strong)UIImageView *tableViewHeaderView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUpStatus];
    [self setUpNav];
    [self setUpTableViewHeaderView];
}
//设置电池状态栏
-(void)setUpStatus
{
    self.status = [[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 20)];
    self.status.backgroundColor = ALPHAColor(0);
    [self.navigationController.navigationBar addSubview:self.status];
}
//创建tableView的headView
-(void)setUpTableViewHeaderView
{
    self.tableViewHeaderView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    self.tableViewHeaderView.image = [UIImage imageNamed:@"lb1_img"];
    [self.tableView addSubview:self.tableViewHeaderView];
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    self.tableViewHeaderView.backgroundColor = [UIColor lightGrayColor];
}
//设置导航栏
-(void)setUpNav
{
    self.navigationController.navigationBar.backgroundColor = ALPHAColor(0);
    self.headView = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, 90, 30)];
    self.navigationItem.titleView = self.headView;
    self.headView.alpha = 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
//在代理方法内计算,设置透明度与拉伸
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 0) {
        self.navigationController.navigationBar.backgroundColor = ALPHAColor(scrollView.contentOffset.y/200);
        self.headView.alpha = scrollView.contentOffset.y/200;
        self.status.backgroundColor = ALPHAColor(scrollView.contentOffset.y/200);
    }else
    {
        self.navigationController.navigationBar.backgroundColor = ALPHAColor(0);
        self.headView.alpha = 0;
        self.status.backgroundColor = ALPHAColor(0);
        self.tableViewHeaderView.frame = CGRectMake(scrollView.contentOffset.y/2, scrollView.contentOffset.y, self.view.frame.size.width-scrollView.contentOffset.y, 200-scrollView.contentOffset.y);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

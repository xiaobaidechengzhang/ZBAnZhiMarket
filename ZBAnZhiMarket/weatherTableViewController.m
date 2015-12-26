//
//  weatherTableViewController.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/12.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "weatherTableViewController.h"

@interface weatherTableViewController ()

@end

@implementation weatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(cell == nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if(indexPath.row == 0)
    {
        cell.textLabel.text=@"明天";
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text=@"后天";
    }
    else
    {
        cell.textLabel.text=[NSString stringWithFormat:@"未来%ld天",indexPath.row+1];
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [UIScreen mainScreen].bounds.size.height-50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header=[[UIView alloc] init];
    header.backgroundColor=[UIColor brownColor];
    
    
    
    //一定加上 下面这句 否则不会显示cell的内容 不能向下滚动
    self.tableView.tableHeaderView=header;
    return header;
}

@end

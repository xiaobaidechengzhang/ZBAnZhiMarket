//
//  menuTableView.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/12.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "menuTableView.h"

#import "loginInViewController.h"

@interface menuTableView () 

@property (nonatomic, strong) NSArray *array;



@end

@implementation menuTableView




- (void)viewDidLoad {
    [super viewDidLoad];

    self.array=[[NSArray alloc] initWithObjects:@"登陆",@"设置",@"注销",@"退出", nil];
    
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if(cell == nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    NSString *string=[self.array objectAtIndex:indexPath.row];
    cell.textLabel.text=string;
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    loginInViewController *controller=[[loginInViewController alloc] initWithNibName:@"loginInViewController" bundle:nil];
    controller.view.frame=[UIScreen mainScreen].bounds;
    
    [self.view removeFromSuperview];
    self.parentViewController.hidesBottomBarWhenPushed=YES;
    [self.parentViewController.navigationController pushViewController:controller animated:YES];
    self.parentViewController.hidesBottomBarWhenPushed=NO;
}


@end

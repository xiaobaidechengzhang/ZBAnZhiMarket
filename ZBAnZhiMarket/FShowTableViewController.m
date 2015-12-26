//
//  FShowTableViewController.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/11/29.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "FShowTableViewController.h"

#import "downLoadViewController.h"

@interface FShowTableViewController ()



@end

@implementation FShowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FShowCell"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FShowCell" forIndexPath:indexPath];
    if(cell == nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FShowCell"];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //push以后隐藏tabbar back回来以后显示tabbar
    self.parentViewController.hidesBottomBarWhenPushed=YES;
    
    UIViewController *downLoad=[[downLoadViewController alloc] initWithNibName:@"downLoadViewController" bundle:nil];
    downLoad.view.frame=[UIScreen mainScreen].bounds;
    [self.navigationController pushViewController:downLoad animated:YES];
    
    self.parentViewController.hidesBottomBarWhenPushed=NO;
}


@end

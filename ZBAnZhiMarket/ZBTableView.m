//
//  ZBTableView.m
//  表视图横向滑动
//
//  Created by xiongdi on 15/12/8.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "ZBTableView.h"

#import "ZBHeader.h"

#import "ZBCollectionView.h"

#import "ZBCollection.h"

@interface ZBTableView ()

@property (nonatomic, strong) UIView *collectionView;

@end

@implementation ZBTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ZBCell"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZBCell" forIndexPath:indexPath];
    if(cell == nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZBCell"];
        
    }
    
    //controller 必须是collection view controller的继承类 才能滚动
    //如果是viewcontroller的继承类 不能滚动
    UICollectionViewController *controller=[[ZBCollection alloc] initWithNibName:@"ZBCollection" bundle:nil];
    controller.view.frame=cell.contentView.bounds;
    
    [self addChildViewController:controller];
    [cell.contentView addSubview:controller.view];
    
    /*
    ZBCollectionView *controller=[[ZBCollectionView alloc] initWithNibName:@"ZBCollectionView" bundle:nil];
    controller.view.frame=cell.contentView.bounds;
    [self addChildViewController:controller];
    [cell.contentView addSubview:controller.view];
    */
    //cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 150.0f;
    }
    else if (section > 0)
    {
        return 50.0f;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}


//每个section的header随视图一起滚动 要设置tableview的style为group
//否则header悬停在顶部
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header=[[UIView alloc] init];
    
    CGFloat labelY=0;
    
    if(section == 0)
    {
        labelY=110.0f;
    }
    else
    {
        labelY=10.0f;
    }
    
    UIView *hdsubview=[[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    hdsubview.backgroundColor=[UIColor yellowColor];
    if(section == 0)
    {
        [header addSubview:hdsubview];
    }
    
    
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(10, labelY, 100, 30)];
    
    
    label.text=[NSString stringWithFormat:@"%ld",section];
    label.textColor=[UIColor yellowColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor blueColor];
    
    [header addSubview:label];
    header.backgroundColor=[UIColor brownColor];
    
    UILabel *moreLabel=[[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-60, labelY, 50, 30)];
    moreLabel.text=[NSString stringWithFormat:@"More"];
    moreLabel.textAlignment=NSTextAlignmentCenter;
    [header addSubview:moreLabel];
    
    
    //self.tableView.tableHeaderView=header;
    
    return header;
}




@end

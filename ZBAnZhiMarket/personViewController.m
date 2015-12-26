//
//  ViewController.m
//  个人中心
//
//  Created by xiongdi on 15/12/4.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "personViewController.h"

#import <CoreGraphics/CoreGraphics.h>

#import "menuTableView.h"

#import "weatherViewController.h"

@interface personViewController () <UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *array0;

@property (nonatomic, strong) NSArray *array1;

@property (nonatomic, strong) NSArray *array2;

@property (nonatomic, strong) NSArray *array3;

@property (nonatomic, strong) UIView *menuView;

@property (nonatomic, assign) BOOL *menuIsOrNot;

@property (nonatomic, strong) UILabel *userLabel;

@property (nonatomic, strong) UILabel *passLabel;
@end

@implementation personViewController


-(void)viewWillAppear:(BOOL)animated
{
    self.menuIsOrNot=NO;
    if(self.menuView)
    {
        [self.menuView removeFromSuperview];
    }
}


-(void)addMenu:(UIButton *)sender
{
    if(!self.menuIsOrNot)
    {
        menuTableView *controller=[[menuTableView alloc] initWithNibName:@"menuTableView" bundle:nil];
        controller.view.frame=CGRectMake(self.view.frame.size.width-75, 60, 70, 160);
        self.menuView=controller.view;
        [self addChildViewController:controller];
        [self.view addSubview:controller.view];
        self.menuIsOrNot=YES;
    }
    else if(self.menuIsOrNot)
    {
        [self.menuView removeFromSuperview];
        self.menuIsOrNot=NO;
    }
}

-(void)pushToWeather:(UIButton *)sender
{
    self.hidesBottomBarWhenPushed=YES;
    weatherViewController *controller=[[weatherViewController alloc] initWithNibName:@"weatherViewController" bundle:nil];
    controller.view.frame=[UIScreen mainScreen].bounds;
    
    [self.navigationController pushViewController:controller animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.menuView=[[UIView alloc] init];
    self.menuIsOrNot=NO;
    
    self.title=@"个人中心";
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(addMenu:)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"weather" style:UIBarButtonItemStylePlain target:self action:@selector(pushToWeather:)];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    //self.tableView.contentInset=UIEdgeInsetsMake(100, 0, 0, 0);
    //self.tableView.scrollIndicatorInsets=UIEdgeInsetsMake(100, 0, 0, 0);
    [self.view addSubview:self.tableView];
    self.array0=[[NSArray alloc] initWithObjects:@"我的订单",@"我的团购券",@"我的钱包",@"我的收藏",@"最近浏览",@"待点评",@"服务中心",@"设置", nil];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:) name:@"userName" object:nil];
    
}
-(void)tongzhi:(NSNotification *)text
{
    self.userLabel.text=text.userInfo[@"username"];
    [self.tableView.tableHeaderView addSubview:self.userLabel];
    self.passLabel.text=text.userInfo[@"password"];
    [self.tableView.tableHeaderView addSubview:self.passLabel];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return 8;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.section==0)
    {
        cell.textLabel.text=[NSString stringWithFormat:@"%@",[self.array0 objectAtIndex:indexPath.row]];
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text=[NSString stringWithFormat:@"%@",[self.array1 objectAtIndex:indexPath.row]];
    }
    else if(indexPath.section == 2)
    {
        cell.textLabel.text =[NSString stringWithFormat:@"%@",[self.array2 objectAtIndex:indexPath.row]];
    }
    else if(indexPath.section == 3)
    {
        cell.textLabel.text=[NSString stringWithFormat:@"%@",[self.array3 objectAtIndex:indexPath.row]];
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   // UITableViewHeaderFooterView *header=[[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    UIView *header=[[UIView alloc] init];
    /*
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(header.frame.size.width/2-30, header.frame.size.height/2-60, 60, 60)];
    [header addSubview:imageView];
    
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(header.frame.size.width/2-30, header.frame.size.height/2, 60, 20)];
    [button setTitle:@"登陆/注册" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    button.layer.cornerRadius=0;
    button.layer.borderWidth=0.5;
    button.layer.borderColor=[UIColor grayColor].CGColor;
    [header addSubview:button];
    */
    /*
    for(NSInteger i=0;i<3;i++)
    {
        CGFloat buttonX=10.0f+i*((header.frame.size.width-60.0f)/3+20.0f);
        CGFloat buttonY=64;
        CGFloat buttonW=50.0f;
        CGFloat buttonH=50.0f;
        UIButton *bigButton=[[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
        [bigButton setTitle:[NSString stringWithFormat:@"%ld",i] forState:UIControlStateNormal];
        [bigButton setTitleColor:[UIColor redColor] forState:UIControlStateReserved];
        bigButton.layer.cornerRadius=0;
        bigButton.layer.borderWidth=0.5;
        bigButton.layer.borderColor=[UIColor redColor].CGColor;
        [header addSubview:bigButton];
    }
 */
    
    UILabel *username=[[UILabel alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
    username.textColor=[UIColor blackColor];
    username.textAlignment=NSTextAlignmentCenter;
    self.userLabel=username;
    //[header addSubview:username];
    UILabel *password=[[UILabel alloc] initWithFrame:CGRectMake(15, 65, 50, 50)];
    password.textColor=[UIColor blackColor];
    password.textAlignment=NSTextAlignmentCenter;
    header.backgroundColor=[UIColor whiteColor];
    self.passLabel=password;
    self.tableView.tableHeaderView=header;
    return header;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

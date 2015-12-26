//
//  loginInViewController.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/12.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "loginInViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@interface loginInViewController ()<UITextFieldDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *passTextField;

@end

@implementation loginInViewController

-(void)login:(UIButton *)sender
{
    if([self.userTextField.text isEqualToString:@"123"] && [self.passTextField.text isEqualToString:@"123"])
    {
        NSDictionary *dic=[[NSDictionary alloc] initWithObjectsAndKeys:self.userTextField.text,@"username",self.passTextField.text,@"password", nil];
        NSNotification *notification=[[NSNotification alloc] initWithName:@"userName" object:nil userInfo:dic];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        
        [self.navigationController popToViewController:self.navigationController.viewControllers[0] animated:YES];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"错误" message:@"你输入的用户名或者密码错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}

-(void)rg:(UIButton *)sender
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"登陆";
    
    UILabel *userName=[[UILabel alloc] initWithFrame:CGRectMake(50, 164, 100, 50)];
    userName.text=@"用户名 :";
    userName.textAlignment=NSTextAlignmentLeft;
    userName.textColor=[UIColor blackColor];
    [self.view addSubview:userName];
    
    UITextField *userNameTextField=[[UITextField alloc] initWithFrame:CGRectMake(150, 164, 200, 50)];
    userNameTextField.placeholder=@"  请输入您的用户名";
    userNameTextField.layer.cornerRadius=10.0f;
    userNameTextField.layer.borderWidth=0.6f;
    userNameTextField.layer.borderColor=[UIColor grayColor].CGColor;
    self.userTextField=userNameTextField;
    [self.view addSubview:userNameTextField];
    
    UILabel *password=[[UILabel alloc] initWithFrame:CGRectMake(50, 264, 100, 50)];
    password.text=@"密码 :";
    password.textAlignment=NSTextAlignmentLeft;
    password.textColor=[UIColor blackColor];
    [self.view addSubview:password];
    
    UITextField *passwordTextField=[[UITextField alloc] initWithFrame:CGRectMake(150, 264, 200, 50)];
    passwordTextField.placeholder=@"  请输入您的密码";
    passwordTextField.layer.cornerRadius=10.0f;
    passwordTextField.layer.borderWidth=0.6f;
    passwordTextField.layer.borderColor=[UIColor grayColor].CGColor;
    self.passTextField=passwordTextField;
    [self.view addSubview:passwordTextField];
    
    UIButton *loginInButton=[[UIButton alloc] initWithFrame:CGRectMake(100, 364, 70, 50)];
    [loginInButton setTitle:@"login" forState:UIControlStateNormal];
    [loginInButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginInButton.backgroundColor=[UIColor greenColor];
    loginInButton.layer.cornerRadius=10.0;
    loginInButton.layer.borderWidth=0.2f;
    loginInButton.layer.borderColor=[UIColor grayColor].CGColor;
    [loginInButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginInButton];
    
    UIButton *registerButton=[[UIButton alloc] initWithFrame:CGRectMake(220, 364, 70, 50)];
    [registerButton setTitle:@"register" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    registerButton.backgroundColor=[UIColor redColor];
    registerButton.layer.cornerRadius=10.0;
    registerButton.layer.borderWidth=0.2f;
    registerButton.layer.borderColor=[UIColor grayColor].CGColor;
    [registerButton addTarget:self action:@selector(rg:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

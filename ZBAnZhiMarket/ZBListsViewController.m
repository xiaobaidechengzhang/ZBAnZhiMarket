//
//  ViewController.m
//  分类下拉菜单
//
//  Created by xiongdi on 15/11/26.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "ZBListsViewController.h"

#import "ZBTableViewController.h"

#import "listButton.h"

#import <QuartzCore/QuartzCore.h>

#import <AFNetworking.h>

#import "districtResult.h"

#import "areasResult.h"

#import "ZBCoverView.h"

#import "loadDataObject.h"

@interface ZBListsViewController () <UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) UIView *leftAndRightView;

@property (nonatomic, strong) UITableView *leftTableView;

@property (nonatomic, strong) UITableView *rightTableView;

@property (nonatomic, assign) NSInteger leftCount;

@property (nonatomic, assign) NSInteger rightCount;

@property (nonatomic,assign) BOOL leftAndRightOn;


//记录上一次点击按钮的tag
@property (nonatomic, assign) NSInteger clickButtonTag;
//记录当前点击按钮的tag
@property (nonatomic, assign) NSInteger senderTag;

@property (nonatomic, strong) NSArray *leftArray;

@property (nonatomic, strong) NSArray *rightArray;

@property (nonatomic, strong) NSMutableArray *buttonArray;


@property (nonatomic, strong) NSOperationQueue *queue;

@property (nonatomic, strong) NSMutableArray *results;

@property (nonatomic, strong) NSMutableArray *detailResults;


@property (nonatomic, strong) ZBCoverView *cover;


//loaddataobject
@property (nonatomic, strong) loadDataObject *loadObject;
@end

@implementation ZBListsViewController

#pragma  mark - parseDictionary

-(districtResult *)parseDistricts:(NSDictionary *)dictionary
{
    //这里要写alloc init, 不要直接写districtResult *district；
    districtResult *district=[[districtResult alloc] init];
    if(self.senderTag== 0)
    {
    
        district.districtName=dictionary[@"district_name"];
    
        district.districtID=dictionary[@"district_id"];
        district.bizAreasArray=dictionary[@"biz_areas"];
    }
    else if (self.senderTag == 1)
    {
        
        district.districtName=dictionary[@"cat_name"];
        //NSLog(@"%@",district.districtName);
        district.districtID=dictionary[@"cat_id"];
        district.bizAreasArray=dictionary[@"subcategories"];
        
    }
    
    return district;
}

-(void)parseDictionary:(NSDictionary *)dictionary
{
    NSString *message=dictionary[@"msg"];

    if([message isEqualToString:@"success"])
    {
        NSArray *array;
        if(self.senderTag == 0)
        {
            array=dictionary[@"districts"];
        }
        else if (self.senderTag ==1)
        {
            array=dictionary[@"categories"];
        }
        for(NSDictionary *dic in array)
        {
            districtResult *district;
            district = [self parseDistricts :dic ];
            if(district !=nil)
            {
                [self.results addObject:district];
            }
        }
        self.leftCount=[self.results count];
        
    }
}
//这里self.results要在这里初始化，不要再viewDidLoad里初始化 才有效果

-(void)request: (NSString *)httpUrl withHttpArg: (NSString *)HttpArg  {
    
    self.results=[[NSMutableArray alloc] initWithCapacity:10];
    
    [self.queue cancelAllOperations];
    
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: 0 timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"331c09c3faff33a481c281b7a95e191b" forHTTPHeaderField: @"apikey"];
   
    AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer=[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation,id responseObject){
        
        [self parseDictionary:responseObject];
        
        [self.leftTableView reloadData];
        
        
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        //NSLog(@"%@",[error localizedDescription]);
        
    }];
    [self.queue addOperation: operation];
    
}

#pragma  mark - clickbutton

-(void)clickButton:(UIButton *)sender
{
    if(!self.leftAndRightOn)
    {
        if(sender.tag == 0)
        {
            self.senderTag=sender.tag;
            NSString *httpUrl = @"http://apis.baidu.com/baidunuomi/openapi/districts";
            NSString *httpArg = @"city_id=100010000";
            [self request:httpUrl withHttpArg:httpArg];
        }
        else if (sender.tag==1)
        {
           
            self.senderTag=sender.tag;
            NSString *httpUrl = @"http://apis.baidu.com/baidunuomi/openapi/categories";
            NSString *httpArg = @"";
            [self request:httpUrl withHttpArg:httpArg];
        }
        else if ( sender.tag == 2)
        {
            self.senderTag = sender.tag;
            self.results=[[NSMutableArray alloc] initWithCapacity:10];
            [self.results addObject:@"最新发布"];
            [self.results addObject:@"价格从高到低"];
            [self.results addObject:@"价格从低到高"];
            [self.results addObject:@"销量"];
            self.leftCount=[self.results count];
            [self.leftTableView reloadData];
        }
    }
    
    
        if((sender.tag - self.clickButtonTag) == 0)
        {
            self.clickButtonTag=self.clickButtonTag;
        
        }
        else if (!self.leftAndRightOn)
        {
            self.clickButtonTag=sender.tag;
        }
        else if (self.leftAndRightOn && ABS(sender.tag - self.clickButtonTag))
        {
            self.clickButtonTag=self.clickButtonTag;
        }
    
    
        if(!self.leftAndRightOn  && (sender.tag - self.clickButtonTag)==0 )
        {
            self.leftAndRightOn=!self.leftAndRightOn;
            
            [self.view addSubview:self.leftAndRightView];
            
            self.cover.alpha=0.6;

        }
        else if(self.leftAndRightOn  && (sender.tag - self.clickButtonTag)==0)
        {
            self.leftAndRightOn=NO;
            //[self.leftTableView removeFromSuperview];
            //[self.rightTableView removeFromSuperview];
            [self.leftAndRightView removeFromSuperview];
            self.cover.alpha=0;
        }
    
        else if (self.leftAndRightOn && ABS(sender.tag - self.clickButtonTag) != 0)
        {
            //[self.leftTableView removeFromSuperview];
            //[self.rightTableView removeFromSuperview];
            [self.leftAndRightView removeFromSuperview];
            
            self.cover.alpha=0;

            self.leftAndRightOn=NO;
        
        }
}

#pragma  mark - addbutton

-(void)addButtons
{
    
    NSArray *array=[NSArray arrayWithObjects:@"城市",@"分类",@"查询条件", nil];
    for(NSInteger i=0;i<3;i++)
    {
        NSString *string=[array objectAtIndex:i];
        UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(i*self.view.frame.size.width/3, 64, self.view.frame.size.width/3, 44)];
        button.tag=i;
        [button setTitle:string forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        
        button.layer.cornerRadius=0;
        button.layer.borderWidth=0.5;
        button.layer.borderColor=[UIColor grayColor].CGColor;
        
        [self.buttonArray addObject:button];
    
        [self.view addSubview:button];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.queue=[[NSOperationQueue alloc] init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailResults=[[NSMutableArray alloc] initWithCapacity:10];
    
    self.leftAndRightOn=NO;;
    
    self.clickButtonTag=0;
    
    self.buttonArray=[[NSMutableArray alloc] initWithCapacity:20];

    [self addButtons];
    
    self.loadObject=[[loadDataObject alloc] init];
    
    self.loadObject.catID=[NSString stringWithFormat:@"326"];
    self.loadObject.subcatID=[NSString stringWithFormat:@"312"];
    self.loadObject.districtID=[NSString stringWithFormat:@"394"];
    self.loadObject.bizareaID=[NSString stringWithFormat:@"1321"];
    
    UITableViewController *ZBController=[[ZBTableViewController alloc] initWithNibName:@"ZBTableViewController" bundle:nil];
    ZBController.view.frame=CGRectMake(0, 108, self.view.frame.size.width, self.view.frame.size.height-64.0f);
    [self addChildViewController:ZBController];
    [self.view addSubview:ZBController.view];
    
    ZBCoverView *coverView=[[ZBCoverView alloc] initWithFrame:CGRectMake(0, 108, self.view.frame.size.width, self.view.frame.size.height-64.0f)];
    
    coverView.alpha=0;
    self.cover=coverView;
    
    [self.view addSubview:self.cover];
    
    
    self.leftAndRightView=[[UIView alloc] initWithFrame:CGRectMake(0, 108, self.view.frame.size.width, 250)];
    
    self.leftAndRightView.backgroundColor=[UIColor whiteColor];
    
    self.leftTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 200) style:UITableViewStylePlain];
    
    [self.leftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"leftCell"];
    
    self.leftTableView.delegate=self;
    self.leftTableView.dataSource=self;
    [self.leftAndRightView addSubview:self.leftTableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.leftTableView)
    {
        return self.leftCount;
        
    }
    else if(tableView == self.rightTableView)
    {
        return self.rightCount;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    districtResult *district=[[districtResult alloc] init];
    if(self.senderTag == 0 || self.senderTag==1)
    {
        district=self.results[indexPath.row];
    }
    
    areasResult *areas=[[areasResult alloc] init];
    if(tableView == self.leftTableView)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:@"leftCell" forIndexPath:indexPath];
        if(cell == nil)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leftCell"];
        }
        if(self.senderTag == 0 || self.senderTag == 1)
        {
            cell.textLabel.text=district.districtName;
        }
        else if(self.senderTag == 2)
        {
            cell.textLabel.text=[NSString stringWithFormat:@"%@",[self.results objectAtIndex:indexPath.row]];
        }

        cell.textLabel.textColor=[UIColor blueColor];
    }
    
    else if (tableView == self.rightTableView)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:@"rightCell" forIndexPath:indexPath];
        if(cell == nil)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rightCell"];
        }
        
        areas=self.detailResults[indexPath.row];
        cell.textLabel.text=areas.bizAreaName;

        cell.textLabel.textColor=[UIColor blackColor];
    }
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    //cell.contentView.backgroundColor=[UIColor grayColor];
    return cell;
}

-(void)sendURL:(NSString *)httpUrl withArg:(NSString *)httpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, httpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"331c09c3faff33a481c281b7a95e191b" forHTTPHeaderField: @"apikey"];
    
    AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer=[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation,id responseObject){
        
       // NSLog(@"success");
        NSLog(@"%@",responseObject);
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"%@",[error localizedDescription]);
        
    }];
    [self.queue addOperation: operation];
}

-(void)loadLists
{
    //load data
    NSString *httpUrl = @"http://apis.baidu.com/baidunuomi/openapi/searchdeals";
     //NSString *httpArg = @"city_id=100010000&cat_ids=326&subcat_ids=962%2C994&district_ids=394%2C395&bizarea_ids=1322%2C1328&location=116.4374%2C39.8719&keyword=%E9%87%91%E9%BC%8E%E8%BD%A9&radius=3000&sort=0&page=1&page_size=10&is_reservation_required=0";
    
    NSString *httpArg = [NSString stringWithFormat:@"city_id=100010000&cat_ids=%@&subcat_ids=%@&district_ids=%@&bizarea_ids=%@sort=0&page=1&page_size=10&is_reservation_required=0",self.loadObject.catID,self.loadObject.subcatID,self.loadObject.districtID,self.loadObject.bizareaID];
    
    [self sendURL:httpUrl withArg:httpArg];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.leftTableView)
    {
        
        //add right tableview
        if(self.senderTag == 0 || self.senderTag == 1)
        {
            self.rightTableView=[[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, 200) style:UITableViewStylePlain];
        
            [self.rightTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"rightCell"];
            self.rightTableView.delegate=self;
            self.rightTableView.dataSource=self;
            [self.leftAndRightView addSubview:self.rightTableView];

            self.detailResults=[[NSMutableArray alloc] initWithCapacity:10];
            districtResult *distric=[[districtResult alloc] init];
            distric=self.results[indexPath.row];
            
            
            
            for(NSDictionary *dic in distric.bizAreasArray)
            {
                areasResult *areas=[[areasResult alloc] init];
                if(self.senderTag == 0)
                {
                    areas.bizAreaName=dic[@"biz_area_name"];
                    areas.bizAreaID=dic[@"biz_area_id"];
                    
                }
                else if (self.senderTag == 1)
                {
                    areas.bizAreaName=dic[@"subcat_name"];
                    areas.bizAreaID=dic[@"subcat_id"];
                }
                [self.detailResults addObject:areas];
            }
            self.rightCount=self.detailResults.count;
            }
        
        else if (self.senderTag == 2)
        {
            self.rightCount=0;
        }
        
        
        
        
        
        if(self.rightCount > 0)
        {
            districtResult *distric=[[districtResult alloc] init];
            distric=self.results[indexPath.row];
            
            if(self.senderTag == 0)
            {
                self.loadObject.districtID=distric.districtID;
                
            }
            else if (self.senderTag == 1)
            {
                self.loadObject.catID=distric.districtID;
            }
            
            //[self loadLists];
            
            
            
            [self.rightTableView reloadData];
        }
        else
        {
            UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
            UIButton *clickButton=[self.buttonArray objectAtIndex:self.clickButtonTag];
            
            [clickButton setTitle:cell.textLabel.text forState:UIControlStateNormal];
            
            self.leftAndRightOn=NO;
            [self.leftAndRightView removeFromSuperview];
            
            self.cover.alpha=0;
            
            districtResult *distric=[[districtResult alloc] init];
            distric=self.results[indexPath.row];
            
            if(self.senderTag == 0)
            {
                self.loadObject.districtID=distric.districtID;
                
            }
            else if (self.senderTag == 1)
            {
                self.loadObject.catID=distric.districtID;
            }
            
            [self loadLists];
            
            [self.results removeAllObjects];
            
            
            
        }
    }
    
    
    if(tableView == self.rightTableView)
    {
        UIButton *clickButton=[self.buttonArray objectAtIndex:self.clickButtonTag];
        UITableViewCell *clickCell=[tableView cellForRowAtIndexPath:indexPath];
        [clickButton setTitle:clickCell.textLabel.text forState:UIControlStateNormal];

        self.leftAndRightOn=NO;
        //[self.leftTableView removeFromSuperview];
        [self.rightTableView removeFromSuperview];
        [self.leftAndRightView removeFromSuperview];
        
        self.cover.alpha=0;
        
        areasResult *areas=[[areasResult alloc] init];
        areas=[self.detailResults objectAtIndex:indexPath.row];
        if(self.senderTag == 0)
        {
            self.loadObject.bizareaID=areas.bizAreaID;
            NSLog(@"%@",areas.bizAreaID);
        }
        else if (self.senderTag == 1)
        {
            self.loadObject.subcatID=areas.bizAreaID;
            
        }
        
        [self loadLists];
        
        
        [self.results removeAllObjects];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

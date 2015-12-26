//
//  ViewController.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/11/20.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "ViewController.h"

#import "FShowTableViewController.h"

#import "appViewController.h"

#import "SCViewController.h"

#import "ZBTableView.h"

#import "searchView.h"

@interface ViewController () <UIScrollViewDelegate,UISearchBarDelegate,UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *smallScrollView;

@property (weak, nonatomic) IBOutlet UIScrollView *bigScrollView;

@property (nonatomic,retain) NSMutableArray *viewsA;

@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) NSTimer *searchTimer;

//@property (nonatomic, assign) CGFloat buttonW;

@end

@implementation ViewController

-(void)downLoad
{
    
}



-(void)changePlaceholder
{
    if([self.searchBar.placeholder isEqualToString:@"QQ"])
    {
        self.searchBar.placeholder=@"浏览器";
    }
    else if([self.searchBar.placeholder isEqualToString:@"浏览器"])
    {
        self.searchBar.placeholder=@"WEB";
    }
    else if([self.searchBar.placeholder isEqualToString:@"WEB"])
    {
        self.searchBar.placeholder=@"QQ";
    }
}

-(void)tap:(UITapGestureRecognizer *)sender
{
    searchView *controller=[[searchView alloc] initWithNibName:@"searchView" bundle:nil];
    controller.view.frame=[UIScreen mainScreen].bounds;
    self.searchBar.superview.userInteractionEnabled=NO;
    self.searchBar.userInteractionEnabled=YES;
    [self.searchBar becomeFirstResponder];
    self.searchBar.placeholder=@"";
    [self.searchTimer invalidate];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)addSearch
{
    
    UIView *searchView=[[UIView alloc] initWithFrame:CGRectMake(80, 2, 200, 40)];
    searchView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [searchView addGestureRecognizer:tap];
    
    
    UISearchBar *search=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    search.delegate=self;
    search.placeholder=@"QQ";
    
    self.searchBar=search;
    
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(changePlaceholder) userInfo:nil repeats:YES];
    self.searchTimer=timer;
    [searchView addSubview:search];
    [self.navigationController.navigationBar addSubview:searchView];
}

-(void)viewWillAppear:(BOOL)animated

{
    [super viewWillAppear:animated];
    self.searchBar.userInteractionEnabled=NO;
    self.searchBar.superview.userInteractionEnabled=YES;
    self.searchBar.placeholder=@"QQ";
    [self.searchBar resignFirstResponder];
    [self.searchTimer isValid];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewsA=[[NSMutableArray alloc] initWithCapacity:5];
    //self.title=@"首页";
    UIBarButtonItem *FButton=[[UIBarButtonItem alloc] initWithTitle:@"下载" style:UIBarButtonItemStylePlain target:self action:@selector(downLoad)];
    //UIBarButtonItem *SButton=[[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    //NSArray *barButtonItemArray=[[NSArray alloc] initWithObjects:FButton,SButton, nil];
    NSArray *barButtonItemArray=[[NSArray alloc] initWithObjects:FButton, nil];
    self.navigationItem.rightBarButtonItems=barButtonItemArray;
    [self addSmallScrollView];
    [self addBigScrollView];
    
    UIView *FView=[self.viewsA objectAtIndex:0];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 1, 0.5 });
    [FView setBackgroundColor:[UIColor colorWithCGColor:colorref]];
    
    [self addSearch];
    

   
    
    //[self.navigationController.navigationBar addSubview:search];
    
    
}

-(void)setSelectedViewUnderLineColorWithIndex:(NSInteger )index
{
    UIView *selectedView=[self.viewsA objectAtIndex:index];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 1, 0.5 });
    [selectedView setBackgroundColor:[UIColor colorWithCGColor:colorref]];
}

-(void)setOtherViewUnderLineColorWithIndex:(NSInteger)index
{
    UIView *selectedView=[self.viewsA objectAtIndex:index];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 96/255.0f, 96/255.0f, 96/255.0f, 0.5 });
    [selectedView setBackgroundColor:[UIColor colorWithCGColor:colorref]];
}

-(void)clickButton:(UIButton *)btnSender
{
    
    NSInteger i=btnSender.tag;
    //NSLog(@"%@",btnSender.titleLabel.text);
    self.title=btnSender.titleLabel.text;
    
    if(i == 1 || i==2 || i==3)
    {
        CGFloat contentX=(i-1) * btnSender.frame.size.width;
        CGFloat contentY=self.smallScrollView.contentOffset.y;
        CGPoint contentP=CGPointMake(contentX, contentY);
        if(self.smallScrollView.contentOffset.x != contentX)
        {
            [self.smallScrollView setContentOffset:contentP animated:YES];
        }
    }
    for(NSInteger s=0;s<5;s++)
    {
        if(s== i)
        {
            [self setSelectedViewUnderLineColorWithIndex:s];
            /*
            UIView *selectedView=[self.viewsA objectAtIndex:s];
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 1, 0.5 });
            [selectedView setBackgroundColor:[UIColor colorWithCGColor:colorref]];
             */
        }else
        {
            [self setOtherViewUnderLineColorWithIndex:s];
            /*
            UIView *selectedView=[self.viewsA objectAtIndex:s];
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 96/255.0f, 96/255.0f, 96/255.0f, 0.5 });
            [selectedView setBackgroundColor:[UIColor colorWithCGColor:colorref]];
             */
        }
    }
    [self.bigScrollView setContentOffset:CGPointMake(i*self.bigScrollView.frame.size.width, 0) animated:YES];
    
}

-(void)addSmallScrollView
{
    
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
    CGFloat btnH=42;
    CGFloat btnW=self.view.frame.size.width/3;
    NSArray *array=[[NSArray alloc] initWithObjects:@"首页",@"应用",@"游戏",@"专题",@"分类", nil];
    scrollView.contentSize=CGSizeMake(5*btnW, 44);
    //[self.view addSubview:scrollView];
    //self.automaticallyAdjustsScrollViewInsets=NO;
    //button不显示 加上上面两句 因为定义了scrollview的高度为64
    for(int i=0;i<5;i++)
    {
        UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(i*btnW, 0, btnW, btnH)];
        button.tag=i;
        
        NSString *buttonTitle=[array objectAtIndex:i];
        
        [button setTitle:buttonTitle forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //[button setBackgroundColor:[UIColor redColor]];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        //边框
         [button.layer setMasksToBounds:YES];
         [button.layer setCornerRadius:0];
         [button.layer setBorderWidth:0.5];
         CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
         CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 96/255, 96/255, 96/255, 0.5 });
         [button.layer setBorderColor:colorref];//边框颜色
        
        UIView *ULView=[[UIView alloc] initWithFrame:CGRectMake(i*btnW, btnH, btnW, 2)];
        ULView.backgroundColor=[UIColor colorWithCGColor:colorref];
        [self.viewsA addObject:ULView];
        [scrollView addSubview:ULView];
        
         [scrollView addSubview:button];
    }
    //smallScrollView.contentSize=CGSizeMake(5*btnW, 0);
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.delegate=self;
    
    scrollView.bounces=NO;
    self.smallScrollView=scrollView;
    [self.view addSubview:scrollView];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
}

-(void)addBigScrollView
{
    UIScrollView *bigScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 64+self.smallScrollView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-64-self.smallScrollView.frame.size.height)];
    bigScrollView.contentSize=CGSizeMake(5*self.view.frame.size.width, self.view.frame.size.height-64-self.smallScrollView.frame.size.height);
    self.automaticallyAdjustsScrollViewInsets=NO;
    bigScrollView.showsHorizontalScrollIndicator=YES;
    bigScrollView.delegate=self;
    bigScrollView.pagingEnabled=YES;
    bigScrollView.bounces=NO;
    
    //添加首页对应的页面
    UITableViewController *FSViewController=[[FShowTableViewController alloc] initWithNibName:@"FShowTableViewController" bundle:nil];
    FSViewController.view.frame=CGRectMake(0, 0, bigScrollView.frame.size.width, bigScrollView.frame.size.height);
    //必须加上下面这一行代码，才能显示 tableview的内容
    [self addChildViewController:FSViewController];
    [bigScrollView addSubview:FSViewController.view];
    
    /*
    //添加第二个页面
    UICollectionViewController *appCollectionView=[[appCollectionViewController alloc] initWithNibName:@"appCollectionViewController" bundle:nil];
    appCollectionView.view.frame=CGRectMake(bigScrollView.frame.size.width, 0, bigScrollView.frame.size.width, bigScrollView.frame.size.height);
    [self addChildViewController:appCollectionView];
    [bigScrollView addSubview:appCollectionView.view];
    */
    
    
    
    //添加第二个页面
    UIViewController *appCollectionView=[[appViewController alloc] initWithNibName:@"appViewController" bundle:nil];
    appCollectionView.view.frame=CGRectMake(bigScrollView.frame.size.width, 0, bigScrollView.frame.size.width, bigScrollView.frame.size.height);
    [self addChildViewController:appCollectionView];
    [bigScrollView addSubview:appCollectionView.view];
    
    
    
    
    /*
    //添加第二个页面
    UIView *view2=[[UIView alloc] initWithFrame:CGRectMake(bigScrollView.frame.size.width, 0, bigScrollView.frame.size.width, bigScrollView.frame.size.height)];
    view2.backgroundColor=[UIColor blackColor];
    [bigScrollView addSubview:view2];
     */
    
    //第三个页面
    UIViewController *SCController=[[SCViewController alloc] initWithNibName:@"SCViewController" bundle:nil];
    SCController.view.frame=CGRectMake(2*bigScrollView.frame.size.width, 0, bigScrollView.frame.size.width, bigScrollView.frame.size.height);
    [self addChildViewController:SCController];
    [bigScrollView addSubview:SCController.view];
    
    
    
    
    /*
    //添加第三个页面
    UIView *view3=[[UIView alloc] initWithFrame:CGRectMake(2*bigScrollView.frame.size.height, 0, bigScrollView.frame.size.width, bigScrollView.frame.size.height)];
    view3.backgroundColor=[UIColor blueColor];
    [bigScrollView addSubview:view3];
    */
    
    
    //第四个页面
    /*
    UIView *view4=[[UIView alloc] initWithFrame:CGRectMake(3*bigScrollView.frame.size.width, 0, bigScrollView.frame.size.width, bigScrollView.frame.size.height)];
    view4.backgroundColor=[UIColor blueColor];
    [bigScrollView addSubview:view4];
    */
    
    //添加第四个页面
    UITableViewController *ZBTableViewController=[[ZBTableView alloc] initWithNibName:@"ZBTableView" bundle:nil];
    ZBTableViewController.view.frame=CGRectMake(3*bigScrollView.frame.size.width, 0, bigScrollView.frame.size.width, bigScrollView.frame.size.height);
    [self addChildViewController:ZBTableViewController];
    [bigScrollView addSubview:ZBTableViewController.view];
    
    
    UIView *view5=[[UIView alloc] initWithFrame:CGRectMake(4*bigScrollView.frame.size.width, 0, bigScrollView.frame.size.width, bigScrollView.frame.size.height)];
    view5.backgroundColor=[UIColor greenColor];
    [bigScrollView addSubview:view5];
    
    self.bigScrollView=bigScrollView;
    [self.view addSubview:bigScrollView];
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView == self.bigScrollView)
    {
        NSInteger scrollIndex=scrollView.contentOffset.x/scrollView.frame.size.width;
        
        if ( scrollIndex == 2 || scrollIndex == 3 || scrollIndex==1)
        {
            [self.smallScrollView setContentOffset:CGPointMake((scrollIndex-1) *self.smallScrollView.frame.size.width/3, 0) animated:YES];
        }
        for(NSInteger i =0;i<5;i++)
        {
            if(i == scrollIndex)
            {
                [self setSelectedViewUnderLineColorWithIndex:i];
            }
            else{
                [self setOtherViewUnderLineColorWithIndex:i];
            }
        }
    }
}



-(void)addControllers
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

//
//  ZBAppTableViewController.m
//  下载页面
//
//  Created by xiongdi on 15/12/8.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "ZBAppTableViewController.h"

#import "UIImage+MostColor.h"


#import "zoomImageViewController.h"



@interface ZBAppTableViewController () <UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGFloat detailCellHeight;

@property (nonatomic,assign) BOOL big;

@property (nonatomic, assign) CGFloat labelH;

@end

@implementation ZBAppTableViewController
{
    NSMutableArray *_imageURLMArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.detailCellHeight=100.0f;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    self.big=NO;
    _labelH=0;
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
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        return 200.0f;
    }
    else if (indexPath.row == 1)
    {
        return self.detailCellHeight;
    }
    else if(indexPath.row == 2)
    {
        return 300;
    }
    return 0;
}

-(void)tapImage:(UIGestureRecognizer *)sender
{
    //NSLog(@"111");
    NSInteger index=sender.view.tag;
    zoomImageViewController *zoomImageController=[[zoomImageViewController alloc] initWithNibName:@"zoomImageViewController" bundle:nil];
    //NSLog(@"222");
    zoomImageController.view.frame=[UIScreen mainScreen].bounds;
    //zoomImageController.view.frame=self.view.bounds;
    UIView *zoomImageView=[zoomImageController zoomImage:index withArray:_imageURLMArray].view;
    
    [self.parentViewController.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self.view.superview addSubview:zoomImageView];
    [self.parentViewController addChildViewController:zoomImageController];
    [zoomImageController didMoveToParentViewController:self];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    if(indexPath.row==0)
    {
        
        NSArray *URLArray=[NSArray arrayWithObjects:
                           @"http://d.hiphotos.baidu.com/image/w%3D310/sign=aa53b3ed257f9e2f70351b092f31e962/9922720e0cf3d7ca70133e7df01fbe096a63a9d7.jpg",
                           @"http://e.hiphotos.baidu.com/image/w%3D310/sign=d4507def9d3df8dca63d8990fd1072bf/d833c895d143ad4b758c35d880025aafa40f0603.jpg",
                           @"http://c.hiphotos.baidu.com/image/w%3D310/sign=7dc7070f72cf3bc7e800cbede101babd/0e2442a7d933c895cb8d6379d31373f0830200c4.jpg",
                           @"http://h.hiphotos.baidu.com/image/w%3D310/sign=963bf8076509c93d07f208f6af3df8bb/9f510fb30f2442a7861f4facd343ad4bd11302a1.jpg",
                           @"http://f.hiphotos.baidu.com/image/w%3D310/sign=a069c2e5932397ddd6799e056982b216/b58f8c5494eef01fff78e3c7e2fe9925bc317d40.jpg",
                           @"http://h.hiphotos.baidu.com/image/w%3D310/sign=fdc2d7cad5ca7bcb7d7bc12e8e086b3f/0dd7912397dda14422f882bbb0b7d0a20df486c2.jpg", nil];
        _imageURLMArray=[[NSMutableArray alloc] initWithCapacity:20];
        for(int m=0;m<URLArray.count;m++)
        {
            [_imageURLMArray addObject:[URLArray objectAtIndex:m]];
        }
        // NSLog(@"111:%@",_imageURLMArray[1]);
        
        //self.appImageScrollView.frame=CGRectMake(16, 8, 568, 275);
        UIScrollView *appScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        
        
        
        appScrollView.contentSize=CGSizeMake(URLArray.count *appScrollView.frame.size.width*2/5, appScrollView.frame.size.height);
        
        
        for(int i=0;i<[URLArray count];i++)
        {
            NSString *URLString=URLArray[i];
            
            //UIButton
            
            NSURL *url=[NSURL URLWithString:URLString];
            
            NSData *imageData=[NSData dataWithContentsOfURL:url];
            UIImage *image=[UIImage imageWithData:imageData];
            
            CGFloat imageViewX=i*appScrollView.frame.size.width*2/5;
            
            CGFloat imageViewY=0;
            CGFloat imageViewW=appScrollView.frame.size.width*2/5;
            CGFloat imageViewH=appScrollView.frame.size.height;
            
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
            
            UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
            imageView.frame=CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
            imageView.tag=i;
            imageView.userInteractionEnabled=YES;
            [imageView addGestureRecognizer:tap];
            [appScrollView addSubview:imageView];
            /*
            
            UIButton *imageButton=[[UIButton alloc] initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH)];
            [imageButton setImage:image forState:UIControlStateNormal];
            [imageButton setTitle:@"" forState:UIControlStateNormal];
            imageButton.tag=i;
            [imageButton addTarget:self action:@selector(tapImage:) forControlEvents:UIControlEventTouchDown];
            [appScrollView addSubview:imageButton];
             */
        }
        appScrollView.delegate=self;
        
        
        [cell.contentView addSubview:appScrollView];
            
        
        //cell.contentView.backgroundColor=[UIColor brownColor];
    }
    else if (indexPath.row == 1)
    {
        
        
        //cell.contentView.backgroundColor=[UIColor greenColor];
        
        NSString *stringLable=@"1111111111111111111111111111111111111111111111111111111111111111111114444444444444444777777888888888899999999666655555555555879879879879465465465465446665123456789123456789123456789我是一个嘻嘻鸟嘿嘿嘿诶额嘿嘿嘿呵";
        cell.textLabel.text=stringLable;
        cell.textLabel.lineBreakMode=NSLineBreakByCharWrapping;
        cell.textLabel.numberOfLines=0;
        //好像默认的字体大小为20；
        NSDictionary *attributes=@{NSFontAttributeName:[UIFont systemFontOfSize:20.0]};
        CGRect RectCell=[stringLable boundingRectWithSize:CGSizeMake(cell.contentView.frame.size.width, 300.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        self.labelH=RectCell.size.height;
    }
    else if(indexPath.row == 2)
    {
        cell.contentView.backgroundColor=[UIColor blackColor];
    }
    return cell;
}
//为的是clickMore
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"%f",_cellH);
    if(indexPath.row == 1)
    {
        if(!self.big)
        {
            self.detailCellHeight=self.labelH;
            //_cellH=90.0f;
            //self.big=!self.big;
            //[self.tableView reloadData];
        }
        else
        {
            self.detailCellHeight=100.0f;
            //self.big=!self.big;
            //[self.tableView reloadData];
        }
        self.big=!self.big;
        //[self.tableView reloadData];
        NSIndexPath *indexpathCell=[NSIndexPath indexPathForRow:1 inSection:0];
        NSArray *indexPathCells=@[indexpathCell];
        [self.tableView reloadRowsAtIndexPaths:indexPathCells withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}





-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header=[[UIView alloc] init];
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 50)];
    label.text=@"应用头视图";
    label.textColor=[UIColor blackColor];
    label.textAlignment=NSTextAlignmentCenter;
    //label.backgroundColor=[UIColor whiteColor];
    
    [header addSubview:label];
    
    NSString *string=@"http://f.hiphotos.baidu.com/image/w%3D310/sign=a069c2e5932397ddd6799e056982b216/b58f8c5494eef01fff78e3c7e2fe9925bc317d40.jpg";
    NSURL *URL=[NSURL URLWithString:string];
    NSData *imageData=[[NSData alloc] initWithContentsOfURL:URL];
    UIImage *image=[[UIImage alloc] initWithData:imageData];
    UIColor *backcolor=[image mostColor];
    UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
    imageView.frame=CGRectMake(20, 80, 100, 100);
    [header addSubview:imageView];
    
    
    
    header.backgroundColor=backcolor;
    self.tableView.tableHeaderView=header;
    return header;
}

@end

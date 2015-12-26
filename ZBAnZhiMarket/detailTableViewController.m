//
//  detailTableViewController.m
//  糯米cell和商品详情
//
//  Created by xiongdi on 15/12/20.
//  Copyright (c) 2015年 xiaobai. All rights reserved.
//

#import "detailTableViewController.h"

#import "imageHeader.h"

@interface detailTableViewController ()

//@property (nonatomic, assign) CGFloat scrollY;

//@property (nonatomic, strong) UIView *xuanView;

//@property (nonatomic, strong) imageHeader *headerV;

@end

@implementation detailTableViewController

-(void)initWithTitle:(NSString *)titleLabelText withLongTitle:(NSString *)longTitleLabelText withPriceTitle:(NSString *)priceTitleLabelText withImageURL:(NSString *)imageURLString withSalenum:(NSString *)salenum
{
    self.headerV.titleLabel.text=titleLabelText;
    self.headerV.longTitleLabel.text=longTitleLabelText;
    self.headerV.priceLabel.text=priceTitleLabelText;
    self.headerV.imageURL=imageURLString;
    self.headerV.sale_numLabel.text=salenum;
}

-(void)initWithBuyContents:(NSString *)buyContent withTips:(NSString *)consumerTips
{
    self.headerV.buy_contents=buyContent;
    self.headerV.consumer_tips=consumerTips;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.scrollY=86;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {


    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0 || section == 2)
    {
        return 2;
    }
    else{
        return 1;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    //cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    if(indexPath.section == 0)
    {
        NSArray *array=[[NSArray alloc] initWithObjects:@"优惠",@"随便退", nil];
        cell.textLabel.text=[array objectAtIndex:indexPath.row];
        cell.textLabel.textAlignment=NSTextAlignmentLeft;
        if(indexPath.row == 0)
        {
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text=@"查看图文详情";
        cell.textLabel.textColor=[UIColor purpleColor];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textAlignment=NSTextAlignmentLeft;
        
    }
    else if (indexPath.section == 2)
    {
        if(indexPath.row == 0)
        {
            cell.textLabel.text=@"消费提示";
            cell.textLabel.textAlignment=NSTextAlignmentLeft;
            cell.textLabel.textColor=[UIColor blackColor];
        }
        else
        {
            cell.textLabel.text=@"详情";
            cell.textLabel.textAlignment=NSTextAlignmentLeft;
            cell.textLabel.textColor=[UIColor blackColor];
        }
    }
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 200;
    }
    
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        
        /*
        UIView *header=[[UIView alloc] init];
        UIView *qiang=[[UIView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 50)];
        qiang.backgroundColor=[UIColor blueColor];
        //imageHeader *header=[[imageHeader alloc] init];
        
        UILabel *priceLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        priceLabel.text=@"36";
        priceLabel.textColor=[UIColor grayColor];
        [qiang addSubview:priceLabel];
        
        UIButton *qiangButton=[[UIButton alloc] initWithFrame:CGRectMake(100, 5, 200, 40)];
        [qiangButton setTitle:@"立即抢购" forState:UIControlStateNormal];
        [qiangButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        qiangButton.backgroundColor=[UIColor purpleColor];
        [qiang addSubview:qiangButton];
        [header addSubview:qiang];
        //self.headerView=header;
        self.xuanView=qiang;
         */
        
        self.headerV=[[imageHeader alloc] init];
        //self.headerV=header;
        self.xuanView=self.headerV.XTView;
        self.xuanView.backgroundColor=[UIColor blueColor];
        self.tableView.tableHeaderView=self.headerV;
        return self.headerV;
        
    }
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //CGRect frame=self.headerView.XTView.frame;
    CGRect frame=self.xuanView.frame;
    //NSLog(@"%f",scrollView.contentOffset.y);
    if(scrollView.contentOffset.y>=86)
    {
        
        //NSLog(@"contentofset :%f",scrollView.contentOffset.y);
        //NSLog(@"%f",self.scrollY);
        CGFloat y=scrollView.contentOffset.y-self.scrollY;
        CGPoint point=CGPointMake(frame.origin.x, frame.origin.y+y);
        frame=CGRectMake(point.x, point.y, frame.size.width, frame.size.height);
        //self.headerView.XTView.frame=frame;
        self.xuanView.frame=frame;
        self.scrollY=scrollView.contentOffset.y;
        //NSLog(@"frame origin y :%f",frame.origin.y);
        
        
    }
}


@end

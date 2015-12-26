//
//  ReusableView.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/1.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "ReusableView.h"

#import <CoreGraphics/CoreGraphics.h>

@implementation ReusableView

-(instancetype)initWithFrame:(CGRect)frame

{
    self=[super initWithFrame:frame];
    if(self)
    {
        /*
        NSInteger count=[self.URLArray count];
        UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.contentSize=CGSizeMake(frame.size.width*count, frame.size.height);
        scrollView.delegate=self;
        for(NSInteger i=0;i<count;i++)
        {
            NSString *urlstring=[self.URLArray objectAtIndex:i];
            NSURL *url=[NSURL URLWithString:urlstring];
            NSData *imageData=[[NSData alloc] initWithContentsOfURL:url];
            UIImage *image=[[UIImage alloc] initWithData:imageData];
            UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
            imageView.frame=CGRectMake(i*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
            [scrollView addSubview:imageView];
            
            
        }
        scrollView.showsHorizontalScrollIndicator=NO;
         
        [self addSubview:scrollView];
         */
        //NSString *urlString=@"http://f.hiphotos.baidu.com/image/w%3D310/sign=a069c2e5932397ddd6799e056982b216/b58f8c5494eef01fff78e3c7e2fe9925bc317d40.jpg";
       // NSURL *URL=[NSURL URLWithString:urlString];
       // NSData *imageData=[[NSData alloc] initWithContentsOfURL:URL];
       // UIImage *image=[[UIImage alloc] initWithData:imageData];
        //UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
        //imageView.frame=self.bounds;
        //UIImageView *imageV=[[UIImageView alloc] initWithFrame:self.bounds];
        //self.imageView=imageV;
       // [self addSubview:imageV];
        
        
        
        
        
        self.URLArray=[[NSMutableArray alloc] initWithCapacity:20];
        
        UIScrollView *sc=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 100.0f)];
        sc.delegate=self;
        sc.pagingEnabled=YES;
        sc.bounces=NO;
        sc.showsHorizontalScrollIndicator=NO;
        self.scrollView=sc;
        [self addSubview:sc];
        UIPageControl *pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(sc.frame.size.width/2-30, sc.frame.size.height-10, 60, 10)];
        //pageControl.backgroundColor=[UIColor blackColor];
        self.control=pageControl;
        [self addSubview:pageControl];
        
        for(NSInteger i=0;i<4;i++)
        {
            UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(10+(i*((frame.size.width-50)/4 + 10.0f)), 105.0f, (frame.size.width-50)/4, 40.0f)];
            [button setTitle:[NSString stringWithFormat:@"%ld",i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            button.layer.cornerRadius=0;
            button.layer.borderWidth=0.5f;
            button.layer.borderColor=[UIColor grayColor].CGColor;
            button.backgroundColor=[UIColor yellowColor];
            [self addSubview:button];
        }
        
        
        
    }
    return self;
}

-(void)setString:(NSString *)string
{
    //NSLog(@"%@",string);
    //必须是_string
    _string=string;
    [self.URLArray addObject:_string];
    //NSLog(@"%ld",self.URLArray.count);
    
}

-(void)setCount:(NSInteger)count
{
    //NSLog(@"count :::%ld",count);
    _count=count;
    self.scrollView.contentSize=CGSizeMake(self.frame.size.width *_count, self.frame.size.height);
    self.control.numberOfPages=_count;
    //NSLog(@"%@",[self.URLArray objectAtIndex:0]);
    [self addImage];
}

-(void)addImage{
    
    for(NSInteger i=0;i<[self.URLArray count];i++)
    {
        NSURL *URL=[NSURL URLWithString:[self.URLArray objectAtIndex:i]];
         NSData *imageData=[[NSData alloc] initWithContentsOfURL:URL];
         UIImage *image=[[UIImage alloc] initWithData:imageData];
        UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
        imageView.frame=CGRectMake(i*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:imageView];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index=scrollView.contentOffset.x/scrollView.frame.size.width;
    self.control.currentPage=index;
}

@end

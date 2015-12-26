//
//  zoomImageViewController.m
//  scollImages
//
//  Created by xiongdi on 15/11/7.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "zoomImageViewController.h"

@interface zoomImageViewController ()

@property (weak, nonatomic) IBOutlet UIPageControl *imagePageControl;

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;



@end

@implementation zoomImageViewController

-(instancetype)zoomImage:(NSInteger)index withArray:(NSArray *)imageURLArray
{
    
    //NSLog(@"%f",self.view.frame.size.width);
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize=CGSizeMake([imageURLArray count]*self.view.frame.size.width, self.view.frame.size.height);
    UIPageControl *pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-19, self.view.frame.size.height-40, 38, 37)];
    pageControl.numberOfPages=[imageURLArray count];
    pageControl.currentPage=index;
    pageControl.tintColor=[UIColor blueColor];
    
    for(int i=0;i<[imageURLArray count];i++)
    {
        NSURL *imageURL=[NSURL URLWithString:[imageURLArray objectAtIndex:i]];
        NSData *imageData=[NSData dataWithContentsOfURL:imageURL];
        UIImage *image=[UIImage imageWithData:imageData];
        UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
        imageView.frame=CGRectMake(i*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        
        imageView.userInteractionEnabled=YES;
        
        UITapGestureRecognizer *tapGR=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [imageView addGestureRecognizer:tapGR];
        
        
        [scrollView addSubview:imageView];
        
        
    }
    scrollView.contentOffset=CGPointMake(index*self.view.frame.size.width, 0);
    scrollView.pagingEnabled=YES;
    scrollView.delegate=self;
    self.imagePageControl=pageControl;
    self.imageScrollView=scrollView;
    [self.view addSubview:scrollView];
    [self.view addSubview:pageControl];
    
    return self;
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"scrolling");
    self.imagePageControl.currentPage=(scrollView.contentOffset.x+scrollView.frame.size.width/2)/scrollView.frame.size.width;
    
}

-(void)dismiss
{
    [self.parentViewController.navigationController setNavigationBarHidden:NO animated:NO];
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    
}
@end

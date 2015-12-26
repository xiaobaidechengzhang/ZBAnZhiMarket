//
//  ZBCollection.m
//  表视图横向滑动
//
//  Created by xiongdi on 15/12/8.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "ZBCollection.h"

@interface ZBCollection ()

@end

@implementation ZBCollection

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize=CGSizeMake(50, 30);
    flowLayout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 0);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self.collectionView.collectionViewLayout=flowLayout;
    
    self.collectionView.backgroundColor=[UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
    [button setTitle:[NSString stringWithFormat:@"%ld",indexPath.row] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.layer.cornerRadius=5;
    button.layer.borderWidth=0.1f;
    button.layer.borderColor=[UIColor grayColor].CGColor;
    
    for(id sv in cell.contentView.subviews)
    {
        [sv removeFromSuperview];
    }
    
    [cell.contentView addSubview:button];
    
    return cell;
}
/*
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
 {
 NSLog(@"%ld",indexPath.row);
 if(indexPath.row == 1)
 {
 return CGSizeMake(80, 80);
 }
 else if (indexPath.row>1)
 {
 return CGSizeMake(50, 50);
 }
 return CGSizeMake(0, 0);;
 }
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

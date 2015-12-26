//
//  ZBCollectionView.m
//  表视图横向滑动
//
//  Created by xiongdi on 15/12/8.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "ZBCollectionView.h"

@interface ZBCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ZBCollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.itemSize=CGSizeMake(50, 30);
    flowLayout.sectionInset=UIEdgeInsetsMake(0, 10, 0, 0);
    flowLayout.minimumLineSpacing=10.0f;
    flowLayout.minimumInteritemSpacing=20.0f;
    //flowLayout.headerReferenceSize=CGSizeMake(100, 100);
    
    //collectionView是根据collectionview的高度和itemsize的高度来确定行数的
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50) collectionViewLayout:flowLayout];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.backgroundColor=[UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    [self.view addSubview:self.collectionView];
    
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


@end

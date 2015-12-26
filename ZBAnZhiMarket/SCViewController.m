 //
//  SCViewController.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/12/3.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "SCViewController.h"

#import "SCReusableView.h"

#import <CoreGraphics/CoreGraphics.h>

#import "ZBFlowLayout.h"

#define viewW [UIScreen mainScreen].bounds.size.width

#define viewH [UIScreen mainScreen].bounds.size.height

#define cellH 20.0f

#define headerH 20.0f

#define column 3

@interface SCViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

//@property (nonatomic, assign) NSInteger cellCount;

@end

@implementation SCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.cellCount=0;
    
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    ZBFlowLayout *flowLayout=[ZBFlowLayout new];
    
    
    //UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    //每一个都不能少 否则会出错
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumInteritemSpacing=0;
    flowLayout.minimumLineSpacing=0;
    flowLayout.itemSize=CGSizeMake(viewW/3, 20.0f);
    flowLayout.headerReferenceSize=CGSizeMake(viewW, 30.0f);
    flowLayout.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, viewW, viewH) collectionViewLayout:flowLayout];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.backgroundColor=[UIColor whiteColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"SCCell"];
    [self.collectionView registerClass:[SCReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SCHeader"];
    
    [self.view addSubview:self.collectionView];
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 8;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //_cellCount=0;
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"SCCell" forIndexPath:indexPath];
    /*
    if(indexPath.section > 1)
    {
        for(NSInteger i=0;i<indexPath.section;i++)
        {
            NSInteger count=[collectionView numberOfItemsInSection:i];
            _cellCount+=count/column;
        }
    }
    NSLog(@"_cell count :%ld",_cellCount);
    CGFloat cellX=(indexPath.row % column)*viewW/3;
    CGFloat cellY=(indexPath.section+1) *headerH +(_cellCount/column)*cellH+(indexPath.row / column)*cellH;
    cell.frame=CGRectMake(cellX, cellY, viewW/3, cellH);
    
    */
    
    
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
    [button setTitle:[NSString stringWithFormat:@"%ld",indexPath.row] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.layer.cornerRadius=0;
    button.layer.borderWidth=0.5f;
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
    return CGSizeMake(cellW/3, 20);
}
*/
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if(kind == UICollectionElementKindSectionHeader)
    {
        SCReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SCHeader" forIndexPath:indexPath];
        for(NSInteger i=96;i>91;i--)
        {
            header.string=[NSString stringWithFormat:@"安智汉化%ld期",i];
        }
        return header;
    }
    return nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

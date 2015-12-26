//
//  appViewController.m
//  ZBAnZhiMarket
//
//  Created by xiongdi on 15/11/29.
//  Copyright (c) 2015年 xiongdi. All rights reserved.
//

#import "appViewController.h"

#import <CoreGraphics/CoreGraphics.h>

#import "ReusableView.h"


#define viewW [UIScreen mainScreen].bounds.size.width

#define viewH [UIScreen mainScreen].bounds.size.height

#define cellColumn 2

@interface appViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;

//@property (nonatomic, assign) CGFloat viewW;

//@property (nonatomic, assign) CGFloat viewH;
//@property (nonatomic, strong) NSMutableArray *array;


@end

@implementation appViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        
    //self.viewW=self.view.frame.size.width;
    //self.viewH=self.view.frame.size.height;
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize=CGSizeMake(viewW/2-20.0f, 50.0f);
    flowLayout.minimumLineSpacing=10.0f;
    flowLayout.minimumInteritemSpacing=20.0f;
    flowLayout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 150);
    
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, viewW, viewH) collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"appCell"];
    [self.collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    
    //self.collectionView.contentInset=UIEdgeInsetsMake(100, 0, 0, 0);
    
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.backgroundColor=[UIColor whiteColor];
    
    /*
     NSArray *URLArray=[NSArray arrayWithObjects:
     @"http://d.hiphotos.baidu.com/image/w%3D310/sign=aa53b3ed257f9e2f70351b092f31e962/9922720e0cf3d7ca70133e7df01fbe096a63a9d7.jpg",
     @"http://e.hiphotos.baidu.com/image/w%3D310/sign=d4507def9d3df8dca63d8990fd1072bf/d833c895d143ad4b758c35d880025aafa40f0603.jpg",
     @"http://c.hiphotos.baidu.com/image/w%3D310/sign=7dc7070f72cf3bc7e800cbede101babd/0e2442a7d933c895cb8d6379d31373f0830200c4.jpg",
     @"http://h.hiphotos.baidu.com/image/w%3D310/sign=963bf8076509c93d07f208f6af3df8bb/9f510fb30f2442a7861f4facd343ad4bd11302a1.jpg",
     @"http://f.hiphotos.baidu.com/image/w%3D310/sign=a069c2e5932397ddd6799e056982b216/b58f8c5494eef01fff78e3c7e2fe9925bc317d40.jpg",
     @"http://h.hiphotos.baidu.com/image/w%3D310/sign=fdc2d7cad5ca7bcb7d7bc12e8e086b3f/0dd7912397dda14422f882bbb0b7d0a20df486c2.jpg", nil];
     
     
     
    NSString *urlString=@"http://img4.imgtn.bdimg.com/it/u=1467847507,1122560061&fm=23&gp=0.jpg";
    NSURL *URL=[NSURL URLWithString:urlString];
    NSData *imageData=[[NSData alloc] initWithContentsOfURL:URL];
    UIImage *image=[[UIImage alloc] initWithData:imageData];
    UIImageView *imageView=[[UIImageView alloc] initWithImage:image];
    imageView.frame=CGRectMake(0, 0, self.collectionView.frame.size.width, 50);
    [self.collectionView addSubview:imageView];
    */
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
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"appCell" forIndexPath:indexPath];
    //CGFloat cellW=viewW/2-10;
    //CGFloat cellH=70.0f;
    //CGFloat cellX=indexPath.row % cellColumn *cellW;
    //50是section的高度
    //CGFloat cellY=indexPath.row / cellColumn *cellH+50;
    //防止cell服用发生错误
    for(id sv in cell.contentView.subviews)
    {
        [sv removeFromSuperview];
    }
    
    //cell.frame=CGRectMake(cellX, cellY, cellW, cellH);
    
    UIButton *button =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
    [button setTitle:[NSString stringWithFormat:@"%ld",indexPath.row] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.layer.cornerRadius=0;
    button.layer.borderWidth=0.5f;
    button.layer.borderColor=[UIColor grayColor].CGColor;
    
    [cell.contentView addSubview:button];
    
    return cell;
    
    
}


/*
//还是有用的
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(viewW/2, 70.0f);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 50);
}

*/


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *URLArray=[NSArray arrayWithObjects:
                       @"http://d.hiphotos.baidu.com/image/w%3D310/sign=aa53b3ed257f9e2f70351b092f31e962/9922720e0cf3d7ca70133e7df01fbe096a63a9d7.jpg",
                       @"http://e.hiphotos.baidu.com/image/w%3D310/sign=d4507def9d3df8dca63d8990fd1072bf/d833c895d143ad4b758c35d880025aafa40f0603.jpg",
                       @"http://c.hiphotos.baidu.com/image/w%3D310/sign=7dc7070f72cf3bc7e800cbede101babd/0e2442a7d933c895cb8d6379d31373f0830200c4.jpg",
                       @"http://h.hiphotos.baidu.com/image/w%3D310/sign=963bf8076509c93d07f208f6af3df8bb/9f510fb30f2442a7861f4facd343ad4bd11302a1.jpg",
                       @"http://f.hiphotos.baidu.com/image/w%3D310/sign=a069c2e5932397ddd6799e056982b216/b58f8c5494eef01fff78e3c7e2fe9925bc317d40.jpg",
                       @"http://h.hiphotos.baidu.com/image/w%3D310/sign=fdc2d7cad5ca7bcb7d7bc12e8e086b3f/0dd7912397dda14422f882bbb0b7d0a20df486c2.jpg", nil];
    
    if(kind == UICollectionElementKindSectionHeader)
    {
        ReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        //header.string=@"header";
        
        for(NSInteger i=0;i<[URLArray count];i++)
        {
        header.string=[URLArray objectAtIndex:i];
        }
        header.count=[URLArray count];
        NSLog(@"count :%ld",[URLArray count]);
        return header;
        
    }
    /*
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(50, 20, headerView.frame.size.width, 20)];
    
    label.text=@"55555";
    [headerView addSubview:label];
    NSLog(@"header");
     */
    return nil;
}

/*
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    NSLog(@"edgeInset");
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
*/




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  ColViewController.m
//  多种测试
//
//  Created by kfz on 16/7/5.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "ColViewController.h"
#define ID @"collection_Cell"
#define SupplyID @"supplementaryID"
#define RandomColor [UIColor colorWithRed:arc4random()%256/255. green:arc4random()%256/255. blue:arc4random()%256/255. alpha:1.]

@interface ColViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) UICollectionView *collectionView;
@end

@implementation ColViewController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CGRect rect = [UIScreen mainScreen].bounds;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.headerReferenceSize = CGSizeMake(100, 40);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        UICollectionView *colView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
        colView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:colView];
        _collectionView = colView;
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SupplyID];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

#pragma -mark collectionView delegate dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = RandomColor;
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:SupplyID forIndexPath:indexPath];
    view.backgroundColor = RandomColor;
    [view addSubview:[self getLabel]];
    return view;
}

- (UILabel *)getLabel {
    UILabel *lab = ({
        lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 35)];
        lab.backgroundColor = [UIColor whiteColor];
        lab.textColor = [UIColor blackColor];
        lab.font = [UIFont systemFontOfSize:14];
        lab.text = @"this is head View";
        lab;
    });
    return lab;
}


@end























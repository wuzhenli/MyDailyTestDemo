//
//  ViewController.m
//  collectionView_Test
//
//  Created by kfz on 2017/4/1.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "ViewController.h"
#import "JLYCollectionView.h"
#import "JLYCollectionViewCell.h"


@interface ViewController ()<
    UICollectionViewDelegate, UICollectionViewDataSource
>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;



@end

@implementation ViewController
static NSString * const ID = @"JLYCollectionCell_ID";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_collectionView registerNib:[UINib nibWithNibName:@"JLYCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
} //

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JLYCollectionViewCell *cell = (JLYCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.indexPath = indexPath;
    return cell;
}

@end

















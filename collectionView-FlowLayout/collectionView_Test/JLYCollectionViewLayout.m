//
//  JLYCollectionViewLayout.m
//  collectionView_Test
//
//  Created by kfz on 2017/4/1.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "JLYCollectionViewLayout.h"

@interface JLYCollectionViewLayout ()

/// 每个item的布局
@property (strong, nonatomic) NSMutableArray<__kindof UICollectionViewLayoutAttributes*> *attributesArray;
/// 每列的高度
@property (strong, nonatomic) NSMutableArray<NSNumber *> *columeHeightArray;
/// 每一列的宽度
@property (assign, nonatomic) CGFloat itemWidth;

@end

@implementation JLYCollectionViewLayout

- (NSMutableArray<UICollectionViewLayoutAttributes *> *)attributesArray {
    if (_attributesArray == nil) {
        _attributesArray = [NSMutableArray array];
    }
    return _attributesArray;
}
- (NSMutableArray<NSNumber *> *)columeHeightArray {
    if (_columeHeightArray == nil) {
        _columeHeightArray = @[].mutableCopy;
    }
    return _columeHeightArray;
}


- (void)setup {
    _colume = 3;
    _margin = 10.0;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setup];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
        NSLog(@"%s", __func__);
    }
    return self;
}

// Subclasses should always call super if they override.
- (void)prepareLayout {
    [super prepareLayout];
    
    [self.attributesArray removeAllObjects];
    [self.columeHeightArray removeAllObjects];
    _itemWidth = (self.collectionView.bounds.size.width - (_colume + 1)*_margin) * 1.0 / _colume;
    
    for (NSUInteger i = 0; i<_colume; i++) {
        [_columeHeightArray addObject:@0];
    }
    
    NSInteger itemNum = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:0];
    
    for (NSInteger i = 0; i<itemNum; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *att = [self layoutAttributesForItemAtIndexPath:indexPath];
        [_attributesArray addObject:att];
    }
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect; {
    return _attributesArray;
}
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // 1、找到最短的一列，item排在这列后面
    __block NSUInteger minHeighIndex = 0;
    __block CGFloat minHeight = CGFLOAT_MAX;
    [self.columeHeightArray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj floatValue] < minHeight) {
            minHeighIndex = idx;
            minHeight = [obj floatValue];
        }
    }];
    // 2、计算frame
    CGFloat height = arc4random_uniform(100) + 60.0;
    CGFloat x = minHeighIndex * (_margin + _itemWidth) + _margin;
    CGFloat y = [_columeHeightArray[minHeighIndex] floatValue] + _margin;
    att.frame = CGRectMake(x, y, _itemWidth, height);
    
    _columeHeightArray[minHeighIndex] = @(CGRectGetMaxY(att.frame));
    // 3、找到最长的一列
    
    return att;
}

- (CGSize)collectionViewContentSize {
    // 找到最长的一列
    __block NSUInteger maxHeighIndex = 0;
    __block CGFloat maxHeight = -1;
    [_columeHeightArray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj floatValue] > maxHeight) {
            maxHeight = [obj floatValue];
            maxHeighIndex = idx;
        }
    }];
    return CGSizeMake(0, maxHeight);
}


- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    NSLog(@"-----\n%@", NSStringFromCGPoint(proposedContentOffset));
    NSLog(@"%@", NSStringFromCGPoint(velocity));
    
    CGPoint retP = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    NSLog(@"%@", NSStringFromCGPoint(retP));
    return retP;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset {
    NSLog(@"%s", __func__);
    return CGPointMake(0, 20);
}

@end





























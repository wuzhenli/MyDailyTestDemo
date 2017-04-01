//
//  JLYCollectionView.m
//  collectionView_Test
//
//  Created by kfz on 2017/4/1.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "JLYCollectionView.h"
#import "JLYCollectionViewCell.h"

@implementation JLYCollectionView
static NSString * const ID = @"JLYCollectionCell_ID";
- (void)setup {
//    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
//    
//    CGFloat margin = 10;
//    layout.minimumLineSpacing = margin;
//    layout.minimumInteritemSpacing = margin;
//    layout.itemSize = CGSizeMake(SC_Width, 80);
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    
//    self.collectionViewLayout = layout;
}

// UICollectionView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}




@end

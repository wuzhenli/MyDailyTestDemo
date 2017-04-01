//
//  JLYCollectionViewCell.m
//  collectionView_Test
//
//  Created by kfz on 2017/4/1.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "JLYCollectionViewCell.h"

@interface JLYCollectionViewCell ()


@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end

@implementation JLYCollectionViewCell

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    _titleLab.text = [NSString stringWithFormat:@"%lu - %lu", _indexPath.section, _indexPath.item];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end

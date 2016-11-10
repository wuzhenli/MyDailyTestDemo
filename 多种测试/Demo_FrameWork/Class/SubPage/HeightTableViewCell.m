//
//  HeightTableViewCell.m
//  多种测试
//
//  Created by kfz on 16/9/13.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "HeightTableViewCell.h"

@interface HeightTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *contLabel;

@end

@implementation HeightTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imgView.image = [UIImage imageNamed:@"QQ"];
    self.contLabel.text = [NSString stringWithFormat:@"%d", arc4random()%120];
}

- (void)setText:(NSString *)text {
    _text = text;
    self.contLabel.text = text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  TipView.m
//  多种测试
//
//  Created by kfz on 16/6/5.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "TipView.h"

@interface TipView ()

@property (weak, nonatomic) IBOutlet UILabel *faileLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *sendIndicator;

//UIButtonType
@end

@implementation TipView

+ (instancetype)tipView {
    return  [[[NSBundle mainBundle] loadNibNamed:@"TipView" owner:self options:nil] firstObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];

    [self addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"state"]) {
        TipViewState state = [change[@"new"] integerValue];
        switch (state) {
            case TipViewStateNormal:{
                self.faileLabel.hidden = YES;
                [self.sendIndicator stopAnimating];
                break;
            }
            case TipViewStateFaile:{
                self.faileLabel.hidden = NO;
                [self.sendIndicator stopAnimating];
                break;
            }
            case TipViewStateSending:{
                self.faileLabel.hidden = YES;
                self.sendIndicator.hidden = NO;
                [self.sendIndicator startAnimating];
                break;
            }
        }
        
    }
}


- (void)dealloc {
    [self removeObserver:self forKeyPath:@"state"];
}

@end












//
//  MyTextView.m
//  多种测试
//
//  Created by kfz on 16/9/25.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "MyTextView.h"

@interface MyTextView ()

@property (strong, nonatomic) NSLayoutConstraint *heightConstraint;
@property (strong, nonatomic) NSLayoutConstraint *heightLessThenConstraint;
@property (strong, nonatomic) NSLayoutConstraint *heightGreaterThenConstraint;

@end

@implementation MyTextView
- (void)setup {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    

    self.backgroundColor = [UIColor whiteColor];
    CGFloat cornerRadius = 2.5f;
    
    self.scrollIndicatorInsets = UIEdgeInsetsMake(10.0f, 0.0f, 10.0f, 2.0f);
    self.textContainerInset = UIEdgeInsetsMake(7.0f, 2.0f, 7.0f, 2.0f);
    self.contentInset = UIEdgeInsetsMake(1.0f, 0.0f, 1.0f, 0.0f);
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderColor = [UIColor colorWithRed:203/255. green:203/255. blue:203/255. alpha:1.0].CGColor;
    self.layer.borderWidth = 0.33;
    
    
    self.scrollEnabled = YES;
    self.scrollsToTop = NO;
    self.userInteractionEnabled = YES;
    self.font = [UIFont systemFontOfSize:16.0f];
    self.textColor = [UIColor blackColor];
    self.backgroundColor = [UIColor whiteColor];
    self.keyboardAppearance = UIKeyboardAppearanceDefault;
    self.contentMode = UIViewContentModeRedraw;
    self.keyboardType = UIKeyboardTypeDefault;
    self.returnKeyType = UIReturnKeyDefault;
    self.textAlignment = NSTextAlignmentLeft;
    
    
    [self addTextViewNotificationObservers];
    [self associateConstraints];
}

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


- (void)addTextViewNotificationObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveTextViewTextDidChangeNotification:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveTextViewNotification:)
                                                 name:UITextViewTextDidBeginEditingNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveTextViewNotification:)
                                                 name:UITextViewTextDidEndEditingNotification
                                               object:self];
}

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    
    if (self.contentSize.height < self.bounds.size.height + 1) {
        self.contentOffset = CGPointZero;
    }
}

#pragma -mark 关联约束
- (void)associateConstraints {
    for (NSLayoutConstraint *constraint in self.constraints) {
        
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            if (constraint.relation == NSLayoutRelationEqual) {
                self.heightConstraint = constraint;
            } else if (constraint.relation == NSLayoutRelationLessThanOrEqual) {
                self.heightLessThenConstraint = constraint;
            } else if (constraint.relation == NSLayoutRelationGreaterThanOrEqual) {
                self.heightGreaterThenConstraint = constraint;
            }
        }
        
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = [self sizeThatFits:self.frame.size];
    
    CGFloat height = size.height;
    
    height = MIN(self.heightLessThenConstraint.constant , height);
    height = MAX(self.heightGreaterThenConstraint.constant, height);
    
    self.heightConstraint.constant = height;
}


- (void)didReceiveTextViewTextDidChangeNotification:(NSNotification *)notification
{
    [self setNeedsDisplay];
    [self scrollRangeToVisible:NSMakeRange(self.text.length-2, 1)];
    NSLog(@"contentsize : %@", NSStringFromCGSize(self.contentSize));
    NSLog(@"frame       : %@", NSStringFromCGRect(self.frame));
}
- (void)didReceiveTextViewNotification:(NSNotification *)notification
{
    [self setNeedsDisplay];
}





@end

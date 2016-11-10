//
//  PSTextField.h
//  kongfz
//
//  Created by kfz on 16/7/3.
//  Copyright © 2016年 wuzhenli. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TextChangeBlock)(NSString *text);

@interface PSTextField : UIView
@property (copy, nonatomic) NSString *text;

@property (copy, nonatomic) NSString *placeholder;

@property (nonatomic,strong) UIFont *font;

@property(nonatomic) UIKeyboardType keyboardType;
/** 文字改变时调用 */
@property (copy, nonatomic) TextChangeBlock textChangeBlock;

- (void)becomeFirstResponder ;

@end

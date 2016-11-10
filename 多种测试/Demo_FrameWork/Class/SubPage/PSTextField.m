//
//  PSTextField.m
//  kongfz
//
//  Created by kfz on 16/7/3.
//  Copyright © 2016年 wuzhenli. All rights reserved.
//

#import "PSTextField.h"

@interface PSTextField ()<UITextFieldDelegate>

@property (weak, nonatomic) UITextField *textField;
@property (assign, nonatomic) BOOL shouldChanged;

@end

@implementation PSTextField

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    UITextField *tf = ({
        tf = [[UITextField alloc] initWithFrame:self.bounds];
        self.textField = tf;
        [self addSubview:tf];
        
        tf.backgroundColor = [UIColor whiteColor];
        tf.secureTextEntry = YES;
        tf.delegate = self;
        tf;
    });
    self.shouldChanged = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextFieldTextDidChangeNotification object:self.textField];
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.text.length) {
        self.shouldChanged = NO;
    } else {
        self.shouldChanged = YES;
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.shouldChanged == NO) {
        NSString *str = nil;
        if (string.length == 0) { // 输入删除符号
            str = [textField.text substringWithRange:NSMakeRange(0, textField.text.length - 1)];
        }else {
            str = [NSString stringWithFormat:@"%@%@",textField.text,string];
        }
        textField.text = str;
        self.text = str;

    }
    return self.shouldChanged;
}

- (void)textChanged:(NSNotification *)notification {
    self.text = self.textField.text;
}


- (void)setText:(NSString *)text {
    _text = text;
    if (self.textChangeBlock) {
        self.textChangeBlock(text);
    }
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.textField.placeholder = placeholder;
    [self setNeedsDisplay];
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    _keyboardType = keyboardType;
    self.textField.keyboardType = keyboardType;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.textField.font = font;
}

- (void)becomeFirstResponder {
    [self.textField becomeFirstResponder];
}

@end


















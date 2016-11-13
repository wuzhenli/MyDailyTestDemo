//
//  AAViewController.m
//  多种测试
//
//  Created by kfz on 16/8/12.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "AAViewController.h"
#import "NSDate+compare.h"
#import "RegexKitLite.h"
#import "MyTextView.h"
#import "SigalTest.h"
#import "NotificationTool.h"
#import "UIImage+extension.h"
#import "NSString+extension.h"
#import "BBViewController.h"

#define TEST

#define SERVERNAMETEST  @""

@interface AAViewController ()<UITextViewDelegate>

@property (weak, nonatomic) UILabel *label;

@property (weak, nonatomic) UILabel *fontLabel;

@property (weak, nonatomic) IBOutlet MyTextView *textView;

@property (weak, nonatomic) UITextField *tmpField;

@property (strong, nonatomic) IBOutlet UIView *emptionView;

@property (strong, nonatomic) NSTimer *timer;
@end

@implementation AAViewController

- (UILabel *)label {
    if (!_label) {
        UILabel *l = [[UILabel alloc] init];
        l.backgroundColor = [UIColor redColor];
        [self.view addSubview:l];
        _label = l;
    }
    return _label;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:@"AAViewController" bundle:nibBundleOrNil]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);
    
    
    
    self.label.backgroundColor = [UIColor redColor];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self addLayout];
}

- (void)addLayout {
    UIView *view = self.label;
    // 1
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1. constant:90];
    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1. constant:20];
    NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1. constant:-20];
    NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1. constant:40];
    
    NSArray<NSLayoutConstraint *> *constraints = @[constraintTop, constraintLeft, constraintRight, constraintHeight];
    [self.view addConstraints:constraints];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.timer invalidate];
}



- (IBAction)pop:(id)sender {
    self.timer = [NSTimer timerWithTimeInterval:3. target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
                  
- (void)timerRun {
    NSLog(@"%s", __func__);
}

//- (void)adjustChinese {
//    NSString *str;
//    if ([AdjustString isHanzi:str]) {
//        NSLog(@"%@:是中文",str);
//    }
//    str = @"ß";
//    if ([AdjustString isHanzi:str]) {
//        NSLog(@"%@:是中文",str);
//    }
//    str = @"💥";
//    if ([AdjustString isHanzi:str]) {
//        NSLog(@"%@:是中文",str);
//    }
//    str = @"的";
//    if ([AdjustString isHanzi:str]) {
//        NSLog(@"%@:是中文",str);
//    }
//}





- (void)test {
    __block typeof(self) ws = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@", ws);
    });
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




- (IBAction)goToBViewConstroller:(id)sender {
    BBViewController *vc = [[BBViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize {
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}





- (IBAction)updateName:(id)sender {
    self.label.text = [SigalTest shareSigal].name;
}
- (IBAction)addName:(id)sender {
    NSScanner *scanner = [NSScanner scannerWithString:self.label.text];
    [scanner scanString:@"lily:" intoString:nil];
    NSInteger i = -1;
    [scanner scanInteger:&i];
    i ++;
    
    self.label.text = [NSString stringWithFormat:@"lily:%zd", i];
    [SigalTest shareSigal].name = self.label.text;
    [[NSUserDefaults standardUserDefaults] setObject:self.label.text forKey:NAME];
}


- (IBAction)startNotification:(id)sender {
    [NotificationTool registerLocalNotification:[SigalTest shareSigal].name];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if ([UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
//            [NotificationTool registerLocalNotification:[SigalTest shareSigal].name];
//        }
//    });
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if ([UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
//            [NotificationTool registerLocalNotification:[SigalTest shareSigal].name];
//        }
//    });
    
}












- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([textView.text hasSuffix:@"]"] && text.length == 0) {
        [textView deleteBackward];
    }
    
    return YES;
}

- (UITextField *)tmpField {
    if (!_tmpField) {
        UITextField *tmpField = [[UITextField alloc] init];
        [self.view addSubview:tmpField];
        _tmpField = tmpField;
        self.tmpField.inputView = self.emptionView;
    }
    return _tmpField;
}
//表情键盘
- (IBAction)buttonClicked:(id)sender {
    [self.tmpField becomeFirstResponder];
}































- (void)testFont {
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 300, 30)];
        self.fontLabel = lab;
        lab.font = font;
        lab.textColor = [UIColor redColor];
        lab.text = @"label";
        [self.view addSubview:lab];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFont) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)changeFont {
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.fontLabel.font = font;
}




/**
 * 判断是否是 拍卖、书店书籍 链接
 */
- (BOOL)isBookLink:(NSString *)urlString {
    
    // 书店
    NSString *scannPreLink = @"http://book.kongfz.com/";
#ifdef SERVERNAMETEST
    scannPreLink = @"http://neibubook.kongfz.com/";
#endif
    
    NSString *preLink = nil;
    NSScanner *aScanner = [NSScanner scannerWithString:urlString];
    
    [aScanner scanString:scannPreLink intoString:&preLink];
    if (preLink == nil) {
        // 拍卖
        scannPreLink = @"http://www.kongfz.cn/";
#ifdef SERVERNAMETEST
        scannPreLink = @"http://neibuwww.kongfz.cn/";
#endif
        [aScanner scanString:scannPreLink intoString:&preLink];
        if (preLink == nil) {
            return NO;
        } else {
            //
            NSInteger itemId = -1;
            [aScanner scanInteger:&itemId];
            if (itemId != -1) {
                return YES;
            }
        }
    } else {
        NSInteger itemId = -1;
        NSInteger shopId = -1;
        [aScanner scanInteger:&shopId];
        [aScanner scanString:@"/" intoString:nil];
        [aScanner scanInteger:&itemId];
        
        if (itemId != -1 && shopId != -1) {
            return YES;
        }
    }
    
    return NO;
    /*
     普通
     http://neibubook.kongfz.com/16917/4050/?ref=search
     http://neibubook.kongfz.com/26045/3402/?ref=search
     http://neibubook.kongfz.com/7032/296265515/?ref=search
     ——
     online
     http://book.kongfz.com/19865/564033071/?ref=search
     http://book.kongfz.com/21177/553450760/?ref=search
     http://book.kongfz.com/219843/551105342/?ref=search
     
     http://book.kongfz.com/8028/564040734/?ref=search
     http://book.kongfz.com/8028/350640112/?ref=detail.seller
     http://book.kongfz.com/8028/350635806/?ref=detail.seller
     
     
     拍卖
     http://neibuwww.kongfz.cn/20216279/
     http://neibuwww.kongfz.cn/20216132/
     ——
     online
     http://www.kongfz.cn/23725447/
     http://www.kongfz.cn/23722676/
     http://www.kongfz.cn/23738204/
     */
}



- (void)testScanner:(NSString *)urlString {
    // 书店
    NSString *scannPreLink = @"http://book.kongfz.com/";
#ifdef TEST
    scannPreLink = @"http://neibubook.kongfz.com/";
#endif
    
    NSString *preLink = nil;
    NSScanner *aScanner = [NSScanner scannerWithString:urlString];
    
    [aScanner scanString:scannPreLink intoString:&preLink];
    if (preLink == nil) {
        // 拍卖
        scannPreLink = @"http://www.kongfz.cn/";
#ifdef TEST
        scannPreLink = @"http://neibuwww.kongfz.cn/";
#endif
        [aScanner scanString:scannPreLink intoString:&preLink];
        if (preLink == nil) {
            // 跳转到webVC
        } else {
            //
            
            NSInteger itemId = -1;
            [aScanner scanInteger:&itemId];
            NSLog(@"进入拍卖界面  itemId:%ld", itemId);
        }
    } else {
        NSInteger itemId = -1;
        NSInteger shopId = -1;
        [aScanner scanInteger:&shopId];
        [aScanner scanString:@"/" intoString:nil];
        [aScanner scanInteger:&itemId];
        
        NSLog(@"进入图书详情界面 shopId:%ld   itemId:%ld",shopId, itemId);
    }
}
/*
 
 普通
 http://neibubook.kongfz.com/16917/4050/?ref=search
 http://neibubook.kongfz.com/26045/3402/?ref=search
 http://neibubook.kongfz.com/7032/296265515/?ref=search
 ——
 online
 http://book.kongfz.com/19865/564033071/?ref=search
 http://book.kongfz.com/21177/553450760/?ref=search
 http://book.kongfz.com/219843/551105342/?ref=search
 
 http://book.kongfz.com/8028/564040734/?ref=search
 http://book.kongfz.com/8028/350640112/?ref=detail.seller
 http://book.kongfz.com/8028/350635806/?ref=detail.seller
 
 
 拍卖
 http://neibuwww.kongfz.cn/20216279/
 http://neibuwww.kongfz.cn/20216132/
 ——
 online
 http://www.kongfz.cn/23725447/
 http://www.kongfz.cn/23722676/
 http://www.kongfz.cn/23738204/
 */




- (void)testTime {
    /*
     NSDate *now = [NSDate date];
     NSTimeInterval time = [now timeIntervalSince1970];
     NSLog(@"%f", time);
     
     NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:time];
     
     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
     [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     
     NSString *timeString = [formatter stringFromDate:date2];
     NSLog(@"date2:%@",timeString);
     NSLog(@"now:   %@", [formatter stringFromDate:now]);
     */
    /*
     NSString *timeString = @"2016-08-16 17:05:24";
     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
     [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     
     NSDate *date = [formatter dateFromString:timeString];
     NSLog(@"%lf", [date timeIntervalSince1970]);
     */
    
    /* */
    NSTimeInterval interval = 1471337106.;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *timeString = [formatter stringFromDate:date];
    NSLog(@"%@", date);
    NSLog(@"%@",timeString);
    
}


- (NSString *)getFormetterTimeWdddithTime:(NSString *)time {
    time = [[time componentsSeparatedByString:@" "] firstObject];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *fromDate = [formatter dateFromString:time];
    NSDate *now = [NSDate date];
    
    NSString *retTime = time;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comp = [calendar components:unit fromDate:fromDate toDate:now options:NSCalendarWrapComponents];
    NSLog(@"%ld", (long)comp.year);
    NSLog(@"%ld", (long)comp.month);
    NSLog(@"%ld", (long)comp.day);
    
    NSInteger year = comp.year;
    NSInteger month = comp.month;
    NSInteger day = comp.day;
    
    // 今日
    if (year ==0 && month == 0 ) {
        if (day == 0) {
            retTime = @"今日上书";
        } else if ( day == 1 ) {
            retTime = @"昨日上书";
        }
    }
    return retTime;
}


/**
 * 上书时间格式化
 * 如果上书时间为当天，显示“今日上书”，如果上书时间为昨天，显示“昨日上书”，上书时间为昨天以前的直接显示年月日，格式“yyyy-mm-dd”
 */
- (NSString *)getFormetterTimeWithTime:(NSString *)time {
    time = [[time componentsSeparatedByString:@" "] firstObject];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *fromDate = [formatter dateFromString:time];
    NSDate *now = [NSDate date];
    
    NSString *retTime = nil;
    //    {
    //        NSString *dateStr = @"2016-09-01";
    //        now = [formatter dateFromString:dateStr];
    //    }
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [calendar components:NSCalendarUnitDay  fromDate:fromDate toDate:now options:NSCalendarWrapComponents];
    NSLog(@"%ld", comp.day);
    switch (comp.day) {
        case 0:{
            retTime = @"今日上书";
            break;
        }
        case 1:{
            retTime = @"昨日上书";
            break;
        }
        default:{
            retTime = time;
            break;
        }
    }
    
    return retTime;
}

- (void) test2 {
    __block NSString *str = @"ref=\"http://www.baidu.com#呵呵呵#[偷笑] 12345http://foo.com/blah_blah1 #解放军#//abcdehttp://foo.com/blah_blah2 @Ring花椰菜:就#范德萨发生的#舍不得打[test] 就惯#急急急#着他吧[挖鼻屎]//@崔西狮:小拳头举起又放下了 说点啥好呢…… //@toto97:@崔西狮 蹦米咋不揍他#哈哈哈# 22334http://foo.com/blah_blah3";
    
    /**
     1.判断字符串是否符合某个特定规则
     * 判断某个字符串是否为QQ号码\电话号码\邮箱
     
     2.截取字符串中符合某个特定规则的内容
     * 截取@"#呵呵呵#[偷笑]5345 http://foo.com/blah_blah #解放军# 58937985"的所有话题\表情\链接
     */
    
    // url链接的规则
//    NSString *urlPattern = @"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";
    NSString *urlPattern = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    // | 匹配多个条件,相当于or\或
    NSString *pattern = [NSString stringWithFormat:@"%@",  urlPattern];
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    
    // 2.测试字符串

    NSArray<NSTextCheckingResult *> *result = [regex matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    [result enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRange range = obj.range;
        NSString *linkStr = [str substringWithRange:range];
        
        //获得前5个字符 , 判断是否是孔网链接
        if (range.location >= 5) {
            NSString *preStr = [str substringWithRange:NSMakeRange(range.location - 5, 5)];
            if (![self isKFZWebLink:preStr]) {
                NSString *targetString = [NSString stringWithFormat:@"<a href=\"%@\">%@</a>", linkStr,linkStr];
                str = [str stringByReplacingCharactersInRange:range withString:targetString];
            }
        }
    }];
    NSLog(@"%@", str);
}

- (BOOL)isKFZWebLink:(NSString *)preStr {
    if ([preStr isEqualToString:@"ref=\""] || [preStr isEqualToString:@"src=\""] || [preStr isEqualToString:@"Src=\""]) {
        return YES;
    }
    return NO;
}
/*
 2016-09-19 15:45:13.748 multi test[7030:105064] http://foo.com/blah_blah1 {10, 25}
 2016-09-19 15:45:13.749 multi test[7030:105064] http://foo.com/blah_blah2 {43, 25}
 2016-09-19 15:45:13.750 multi test[7030:105064] http://foo.com/blah_blah3 {165, 25}*/


- (void)compareWithString:(NSString *)str {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *fromDate = [formatter dateFromString:str];
    
    if ([fromDate isSameDay]) {
        NSLog(@"same  day");
    }
    if ([fromDate isYesterday]) {
        NSLog(@"isYesday");
    }
    if ([fromDate isSameMonth]) {
        NSLog(@"isSameMonth");
    }
    if ([fromDate isSameYear]) {
        NSLog(@"isSameYear");
    }
}








/*
 2016-08-16 17:05:24.372 multi test[4799:70115] 1471338324.371927
 2016-08-16 17:05:24.374 multi test[4799:70115] date2:2016-08-16 17:05:24
 2016-08-16 17:05:24.375 multi test[4799:70115] now:   2016-08-16 17:05:24
 */







//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    CGRect rect = self.label.frame;
//    rect.origin.y = 64;
//    self.label.frame = rect;
//    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

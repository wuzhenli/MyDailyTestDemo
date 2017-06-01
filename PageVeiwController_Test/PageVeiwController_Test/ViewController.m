//
//  ViewController.m
//  PageVeiwController_Test
//
//  Created by kfz on 2017/3/31.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "ViewController.h"
#import "BaseViewController.h"

@interface ViewController ()<
    UIPageViewControllerDataSource, UIPageViewControllerDelegate
>
@property (assign, nonatomic) BOOL gestureNextPage;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSMutableArray<BaseViewController *> *vcArray;

@property (assign, nonatomic) NSUInteger currentIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
}


- (void)initData {
    self.vcArray = @[].mutableCopy;
    [_vcArray addObject:[BaseViewController new]];
    [_vcArray addObject:[BaseViewController new]];
    [_vcArray addObject:[BaseViewController new]];
    [_vcArray addObject:[BaseViewController new]];
    [_vcArray objectAtIndex:0].index = 0;
    [_vcArray objectAtIndex:1].index = 1;
    [_vcArray objectAtIndex:2].index = 2;
    [_vcArray objectAtIndex:3].index = 3;
    
    
    NSDictionary *options = @{
                              UIPageViewControllerOptionSpineLocationKey : [NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]
                              // UIPageViewControllerSpineLocationMid UIPageViewControllerSpineLocationMin
                              };
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    
    [_pageViewController setViewControllers:@[[_vcArray firstObject]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        _currentIndex = 0;
    }];

//    [self.view addSubview:_pageViewController];
    [self.view addSubview:_pageViewController.view];
}



// MARK :
//@required
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSLog(@"before");
    _gestureNextPage = NO;
    NSUInteger index = [_vcArray indexOfObject:(BaseViewController *)viewController];
    if (index < 1) {
        return nil;
    }
    return [_vcArray objectAtIndex:index-1];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSLog(@"after");
    _gestureNextPage = YES;
    NSUInteger index = [_vcArray indexOfObject:(BaseViewController *)viewController];
    if (index >= _vcArray.count-1) {
        return nil;
    }
    return [_vcArray objectAtIndex:index+1];
}

// MARK : @optional


//   MARK : UIPageViewControllerDelegate

// @optional
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    NSLog(@"%s", __func__);
    
    NSInteger nextIndex = 0;
    if (_gestureNextPage) {
        nextIndex = _currentIndex + 1;
    } else {
        nextIndex = _currentIndex - 1;
    }
    
    NSLog(@"next:%lu  cur:%lu", nextIndex, _currentIndex);
//    BaseViewController *vc = [_vcArray objectAtIndex:nextIndex];
//    vc.index = nextIndex;
}

// Sent when a gesture-initiated transition ends. The 'finished' parameter indicates whether the animation finished, while the 'completed' parameter indicates whether the transition completed or bailed out (if the user let go early).
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    NSLog(@"didFinishAnimating: finish:%d  completed:%d ", finished, completed);

    if (finished && completed) {
        if (_gestureNextPage) {
            _currentIndex += 1;
        } else {
            _currentIndex -= 1;
        }
        
    }

}

// Delegate may specify a different spine location for after the interface orientation change. Only sent for transition style 'UIPageViewControllerTransitionStylePageCurl'.
// Delegate may set new view controllers or update double-sided state within this method's implementation as well.
//- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
//    
//}
//
//- (UIInterfaceOrientationMask)pageViewControllerSupportedInterfaceOrientations:(UIPageViewController *)pageViewController  {
//    
//}
//- (UIInterfaceOrientation)pageViewControllerPreferredInterfaceOrientationForPresentation:(UIPageViewController *)pageViewController {
//    
//}




@end























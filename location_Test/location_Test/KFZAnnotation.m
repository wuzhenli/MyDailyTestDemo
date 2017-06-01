//
//  KFZAnnotation.m
//  location_Test
//
//  Created by kfz on 2017/4/4.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "KFZAnnotation.h"

@implementation KFZAnnotation

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    _coordinate = newCoordinate;
}

- (UIImage *)icon {
    if (!_icon) {
        _icon = [UIImage imageNamed:@"cameraTrigger_highilight"];
    }
    return _icon;
}

@end

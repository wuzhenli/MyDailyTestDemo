//
//  KFZAnnotation.h
//  location_Test
//
//  Created by kfz on 2017/4/4.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface KFZAnnotation : NSObject <MKAnnotation>
// Center latitude and longitude of the annotation view.
// The implementation of this property must be KVO compliant.
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

//@optional

// Title and subtitle for use by selection UI.
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;

// Called as a result of dragging an annotation view.
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate NS_AVAILABLE(10_9, 4_0);

@property (strong, nonatomic) UIImage *icon;

@end

//
//  ViewController.m
//  location_Test
//
//  Created by kfz on 2017/4/3.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "KFZAnnotation.h"

#define SC_Size   [UIScreen mainScreen].bounds.size
#define SC_Width  [UIScreen mainScreen].bounds.size.width
#define SC_Height [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<CLLocationManagerDelegate,
    MKMapViewDelegate
>
@property (strong, nonatomic) CLLocationManager *lm;

@property (strong, nonatomic) MKMapView *mapView;

@property (strong, nonatomic) KFZAnnotation *annotation;
@end


@implementation ViewController

- (KFZAnnotation *)annotation {
    if (!_annotation) {
        _annotation = [KFZAnnotation new];
    }
    return _annotation;
}

- (MKMapView *)mapView {
    if (!_mapView) {
        _mapView = [MKMapView new];
        _mapView.frame = CGRectMake(0, 0, SC_Width, SC_Height);
        _mapView.showsUserLocation = NO;
        _mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
        _mapView.showsScale = YES;
        _mapView.showsBuildings = YES;
        _mapView.showsTraffic = YES;
        _mapView.delegate = self;
    }
    return _mapView;
}

- (CLLocationManager *)lm {
    if (!_lm) {
        _lm = [[CLLocationManager alloc] init];
        _lm.delegate = self;

//        [_lm requestAlwaysAuthorization];
        [_lm requestWhenInUseAuthorization];
        _lm.allowsBackgroundLocationUpdates = YES;
    }
    return _lm;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mapView];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.mapView removeAnnotation:self.annotation];
    [self.lm startUpdatingLocation];
    
    self.annotation.coordinate = CLLocationCoordinate2DMake(30, 116);
    self.annotation.title = @"CLLocationCoortitle";
    self.annotation.subtitle = @"subtitle";
    
}



- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    NSLog(@"%s", __func__);
//    CLLocationCoordinate2D
//    CLLocation *location = [locations lastObject];
//    self.annotation.coordinate = location.coordinate;
//    
    [manager stopUpdatingLocation];
//    [self.mapView addAnnotation:self.annotation];
    
}
#pragma -mark
#pragma -mark MapView
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLLocation *location = userLocation.location;
    self.annotation.coordinate = location.coordinate;
    
    
    [self.mapView addAnnotation:self.annotation];
    [mapView selectAnnotation:self.annotation animated:YES];
}

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    {
//        return nil;
        // 判断annotation的类型
        if ([annotation isKindOfClass:[MKUserLocation class]]) return nil;
        // 创建MKAnnotationView
        
        static NSString *ID = @"tuangou";
        MKAnnotationView *annoView = [mapView dequeueReusableAnnotationViewWithIdentifier:ID];
        if (annoView == nil) {
            annoView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ID];
            annoView.canShowCallout = YES;
            {
                UIView *rightCallout = [UIView new];
                rightCallout.frame = CGRectMake(0, 0, 30, 30);
                rightCallout.backgroundColor = [UIColor redColor];
                annoView.rightCalloutAccessoryView = rightCallout;
                
            }
        }
        annoView.selected = YES;
        annoView.canShowCallout = YES;
        // 传递模型数据
        annoView.annotation = annotation;
        // 设置图片
        KFZAnnotation *tuangouAnnotation = annotation;
        UIImage *img = tuangouAnnotation.icon;
        annoView.image = img;
        return annoView;
    }
}

@end















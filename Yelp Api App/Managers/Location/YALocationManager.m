//
//  YALocationManager.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YALocationManager.h"
#import <CoreLocation/CoreLocation.h>


@interface YALocationManager() <CLLocationManagerDelegate>

@property (nonatomic, strong, readwrite) CLLocationManager *locationManager;

@property (nonatomic, strong) CLGeocoder *geoCoder;

@property (nonatomic, assign) BOOL isLocationFinishedUpdating;

@end


static NSString *const kErrorMessage = @"We couldn't find your current location at this time.";
static NSString *const kErrorTitle = @"Location Services Unavailable";
static NSInteger const kErrorCode = 0;


@implementation YALocationManager


#pragma mark - Custom Accessors

- (CLLocationManager *)locationManager
{
    if (!_locationManager)
    {
        _locationManager = [[CLLocationManager alloc] init];
    }
    
    return _locationManager;
}


- (CLGeocoder *)geoCoder
{
    if (!_geoCoder)
    {
        _geoCoder = [[CLGeocoder alloc] init];
    }
    
    return _geoCoder;
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    [self.geoCoder reverseGeocodeLocation:manager.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (error != nil)
        {
            if ([self.delegate respondsToSelector:@selector(locationFinishedWithError:errorMessage:)])
            {
                [self.delegate locationFinishedWithError:error errorMessage:kErrorMessage];
            }
        }
        
        if (placemarks.count)
        {
            [self loadLocationInformationWithPlaceMark:[placemarks objectAtIndex:0]];
            [self stopUpdatingLocaiton];
        }
        else
        {
            NSDictionary *userInfo = [NSDictionary errorDictionaryWithDescription:kErrorMessage
                                                                           reason:@"Location services might be disabled or not reachable."
                                                                       suggestion:@"Please enabled your location services or move to another place to get better signal."];
            
            NSError *placemarksError = [NSError errorWithDomain:kErrorTitle code:YAErrorCode userInfo:userInfo];
            
            if ([self.delegate respondsToSelector:@selector(locationFinishedWithError:errorMessage:)])
            {
                [self.delegate locationFinishedWithError:placemarksError errorMessage:kErrorMessage];
            }
        }
    }];
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(locationFinishedWithError:errorMessage:)])
    {
        [self.delegate locationFinishedWithError:error errorMessage:error.localizedDescription];
    }
}


#pragma mark - Helper functions

- (void)requestLocation
{
    self.isLocationFinishedUpdating = NO;
    
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager requestWhenInUseAuthorization];
    
    if (([CLLocationManager locationServicesEnabled]))
    {
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.locationManager startUpdatingLocation];
    }
    else
    {
        NSDictionary *userInfo = [NSDictionary errorDictionaryWithDescription:@"We couldn't find your location due to unenabled location services."
                                                                       reason:@"Location services are disabled."
                                                                   suggestion:@"Please enabled your location services."];
        
        NSError *error = [NSError errorWithDomain:kErrorTitle code:YAErrorCode userInfo:userInfo];
        
        if ([self.delegate respondsToSelector:@selector(locationFinishedWithError:errorMessage:)])
        {
            [self.delegate locationFinishedWithError:error errorMessage:kErrorMessage];
        }
    }
}


- (void)stopUpdatingLocaiton
{
    [self.locationManager stopUpdatingLocation];
    self.isLocationFinishedUpdating = YES;
}


- (void)loadLocationInformationWithPlaceMark:(CLPlacemark *)placeMark
{
    if (self.isLocationFinishedUpdating)
    {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(locationFinishedUpdatingWithCity:state:country:countryCode:)])
    {
        [self.delegate locationFinishedUpdatingWithCity:placeMark.locality state:placeMark.administrativeArea country:placeMark.country countryCode:placeMark.ISOcountryCode];
    }
}

@end

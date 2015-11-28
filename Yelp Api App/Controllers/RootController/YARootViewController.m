//
//  ViewController.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YARootViewController.h"

@interface YARootViewController () <YALocationManagerDelegate>

@property (nonatomic, strong) YALocationManager *location;

@property (nonatomic, strong) YANetworkManager *network;

@end


@implementation YARootViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"1AD6FD"];

    [self.location requestLocation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - YALocationManagerDelegate

- (void)locationFinishedUpdatingWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country countryCode:(NSString *)countryCode
{
    [self.network queryBusinessInformationWithTerm:@"dinner" location:@"Toronto, ON" completionHandler:^(NSDictionary *jsonDictionary, NSError *error)
     {
         NSLog(@"json: %@", jsonDictionary);
    }];
}

- (void)locationFinishedWithError:(NSError *)error errorMessage:(NSString *)errorMessages
{
    NSLog(@"error: %@ error message: %@", error, errorMessages);
}


#pragma mark - Custom Accessors

- (YALocationManager *)location
{
    if (!_location)
    {
        _location = [[YALocationManager alloc] init];
        _location.delegate = self;
    }
    
    return _location;
}


- (YANetworkManager *)network
{
    if (!_network)
    {
        _network = [[YANetworkManager alloc] init];
    }
    
    return _network;
}

@end

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

@end


@implementation YARootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"1AD6FD"];
    
    self.location = [[YALocationManager alloc] init];
    self.location.delegate = self;
    [self.location requestLocation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#warning Testing location manager (REMOVE!)
- (void)locationFinishedUpdatingWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country countryCode:(NSString *)countryCode
{
    NSLog(@"city:%@ state:%@ country:%@ country code:%@", city, state, country, countryCode);
}

- (void)locationFinishedWithError:(NSError *)error errorMessage:(NSString *)errorMessages
{
    NSLog(@"error: %@ error message: %@", error, errorMessages);
}

@end

//
//  ViewController.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YARootViewController.h"
#import "YALocation.h"
#import "YASearchView.h"


@interface YARootViewController () <YALocationManagerDelegate, YASearchViewDelegate>

@property (nonatomic, strong) YALocationManager *location;

@property (nonatomic, strong) YANetworkManager *network;

@property (nonatomic, strong) YASearchView *searchView;

@end


@implementation YARootViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"1AD6FD"];

    [self.view addSubview:self.searchView];
    
    [self.location requestLocation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - YALocationManagerDelegate

- (void)locationFinishedUpdatingWithLocation:(YALocation *)location
{
    NSString *userLocation = [NSString stringWithFormat:@"%@, %@", location.city, location.state];
    
    [self.network queryBusinessInformationWithTerm:@"dinner" location:userLocation completionHandler:^(NSDictionary *jsonDictionary, NSError *error)
     {
         NSLog(@"json: %@", jsonDictionary);
    }];
}

- (void)locationFinishedWithError:(NSError *)error errorMessage:(NSString *)errorMessages
{
    NSLog(@"error: %@ error message: %@", error, errorMessages);
}


#pragma mark - YASearchViewDelegate

- (void)searchViewFinishedWithSearchString:(NSString *)searchString
{
    NSLog(@"%@", searchString);
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


- (YASearchView *)searchView
{
    if (!_searchView)
    {
        _searchView = [[YASearchView alloc] initWithFrame:CGRectMake(20, 30, self.view.frame.size.width - 40, 50)];
        _searchView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        _searchView.delegate = self;
    }
    
    return _searchView;
}

@end

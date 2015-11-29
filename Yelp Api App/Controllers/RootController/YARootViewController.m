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
#import "YACopyRightView.h"


@interface YARootViewController () <YALocationManagerDelegate, YASearchViewDelegate>

@property (nonatomic, strong) YALocationManager *location;

@property (nonatomic ,strong) YALocation *userLocation;

@property (nonatomic, strong) YANetworkManager *network;

@property (nonatomic, strong) YASearchView *searchView;

@property (nonatomic, strong) UIButton *searchButton;

@property (nonatomic, strong) YACopyRightView *copyRightView;

@end


// search view
static CGFloat const kSearchViewX = 20;
static CGFloat const kSearchViewHeight = 50;

// search button
static CGFloat const kSearchButtonPadding = 60;
static CGFloat const kSearchButtonY = 20;
static CGFloat const kSearchButtonSize = 50;
static NSString *const kSearchButtonImageName = @"plus-black";

// copy right label
static CGFloat const kLabelHeight = 20;


@implementation YARootViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view gradientBackgroundWithFirstColor:[UIColor colorWithHexString:YARootControllerFirstBgColor] secondColor:[UIColor colorWithHexString:YARootControllerSecondBgColor]];

    [self.view addSubview:self.searchButton];
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.copyRightView];
    
    [self.location requestLocation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - YALocationManagerDelegate

- (void)locationFinishedUpdatingWithLocation:(YALocation *)location
{
    self.userLocation = location;
}


- (void)locationFinishedWithError:(NSError *)error errorMessage:(NSString *)errorMessages
{
    NSLog(@"error: %@ error message: %@", error, errorMessages);
}


#pragma mark - YASearchViewDelegate

- (void)searchViewFinishedWithSearchString:(NSString *)searchString
{
    NSLog(@"%@", searchString);
    
    [self showOrHideSearchView];
    
    NSString *userLocation = [NSString stringWithFormat:@"%@, %@", self.userLocation.city, self.userLocation.state];
    
    [self.network queryBusinessInformationWithTerm:searchString location:userLocation completionHandler:^(NSDictionary *jsonDictionary, NSError *error)
    {
         NSLog(@"json: %@", jsonDictionary);
    }];
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
        _searchView = [[YASearchView alloc] initWithFrame:self.hideSearchViewFrame];
        _searchView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        _searchView.delegate = self;
    }
    
    return _searchView;
}


- (CGRect)showSearchViewFrame
{
    return CGRectMake(kSearchViewX, CGRectGetMaxY(self.searchButton.frame), (self.view.frame.size.width - (kSearchViewX * 2)), kSearchViewHeight);
}


- (CGRect)hideSearchViewFrame
{
    return CGRectMake(kSearchViewX, -(kSearchViewHeight * 1.5), self.view.frame.size.width - (kSearchViewX * 2), kSearchViewHeight);
}


- (UIButton *)searchButton
{
    if (!_searchButton)
    {
        _searchButton = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetMaxX(self.view.frame) - kSearchButtonPadding), kSearchButtonY, kSearchButtonSize, kSearchButtonSize)];
        _searchButton.backgroundColor = [UIColor clearColor];
        _searchButton.tag = 1;
        [_searchButton setImage:[UIImage imageNamed:kSearchButtonImageName] forState:UIControlStateNormal];
        [_searchButton addTarget:self action:@selector(showOrHideSearchView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _searchButton;
}


- (YACopyRightView *)copyRightView
{
    if (!_copyRightView)
    {
        _copyRightView = [[YACopyRightView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - kLabelHeight, self.view.frame.size.width, kLabelHeight) copyrightText:YACopyrightText copyrightImage:[UIImage imageNamed:YACopyrightImageName]];
        _copyRightView.backgroundColor = [UIColor clearColor];
    }
    
    return _copyRightView;
}


#pragma mark - Show SearchView

- (void)showOrHideSearchView
{
    if (self.searchButton.tag == 1)
    {
        self.searchView.becomeFirstResponder = YES;
        
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            // animations
            self.searchView.frame = self.showSearchViewFrame;
            CGFloat transform = ((M_PI * 3) / 4);
            self.searchButton.transform = CGAffineTransformRotate(CGAffineTransformIdentity, transform);
        }
        completion:^(BOOL finished) {
            if (finished)
            {
                self.searchButton.tag = 2;
            }
        }];
    }
    else
    {
        self.searchView.becomeFirstResponder = NO;
        
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            // animations
            self.searchView.frame = self.hideSearchViewFrame;
            CGFloat transform = ((-M_PI * 3) / 4);
            self.searchButton.transform = CGAffineTransformRotate(self.searchButton.transform, transform);
        }
        completion:^(BOOL finished) {
            if (finished)
            {
                self.searchButton.tag = 1;
                self.searchView.clearTextField = YES;
            }
        }];
    }
}

@end

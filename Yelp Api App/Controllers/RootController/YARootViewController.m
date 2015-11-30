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
#import "YADemoView.h"
#import "YAResultsView.h"


@interface YARootViewController () <YALocationManagerDelegate, YASearchViewDelegate>

@property (nonatomic, strong) YALocationManager *location;

@property (nonatomic ,strong) YALocation *userLocation;

@property (nonatomic, strong) YANetworkManager *network;

@property (nonatomic, strong) YASearchView *searchView;

@property (nonatomic, strong) UIButton *searchButton;

@property (nonatomic, strong) YACopyRightView *copyRightView;

@property (nonatomic, strong) YADemoView *demoView;

@property (nonatomic, strong) YAResultsView *resultsView;

@property (nonatomic, strong) NSArray<YAResultsData *> *resultsData;

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


// resutls view
static CGFloat const kResutlsViewPadding = 10;


@implementation YARootViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view gradientBackgroundWithFirstColor:[UIColor colorWithHexString:YARootControllerFirstBgColor] secondColor:[UIColor colorWithHexString:YARootControllerSecondBgColor]];

    [self.view addSubview:self.demoView];
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
    
    [KVNProgress setConfiguration:[KVNProgressConfiguration defaultConfiguration]];
    [KVNProgress showWithStatus:@"Loading"];
    
    [self.network queryBusinessInformationWithTerm:searchString location:userLocation completionHandler:^(NSDictionary *jsonDictionary, NSError *error)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.resultsData = [NSArray arrayFromResultsDictionary:jsonDictionary];
            NSLog(@"%@", self.resultsData);
            [self.view addSubview:self.resultsView];
            [KVNProgress dismiss];
        });
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
        _searchView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
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


- (YADemoView *)demoView
{
    if (!_demoView)
    {
        _demoView = [[YADemoView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) demoImage:[UIImage imageNamed:YADemoImageName] demoName:YADemoText];
        _demoView.backgroundColor = [UIColor clearColor];
    }
    
    return _demoView;
}


- (YAResultsView *)resultsView
{
    if (!_resultsView)
    {
        _resultsView = [[YAResultsView alloc] initWithFrame:self.resultsViewFrame resultsData:self.resultsData];
        _resultsView.backgroundColor = [UIColor clearColor];
    }
    
    return _resultsView;
}


- (CGRect)resultsViewFrame
{
    return CGRectMake(kResutlsViewPadding, self.resultsViewY, self.view.frame.size.width - (kResutlsViewPadding * 2), self.resultsViewHeight);
}


- (CGFloat)resultsViewY
{
    return (self.searchButton.frame.size.height + kResutlsViewPadding);
}


- (CGFloat)resultsViewHeight
{
    return (self.view.frame.size.height - self.searchButton.frame.size.height - self.copyRightView.frame.size.height - (kResutlsViewPadding * 2));
}


- (void)setResultsData:(NSArray<YAResultsData *> *)resultsData
{
    _resultsData = resultsData;
    
    if (self.resultsData.count)
    {
        self.resultsView.data = self.resultsData;
    }
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
            
            if (_resultsView)
            {
                [self.resultsView hideResultsViewAnimated];
            }
        }
        completion:^(BOOL finished) {
            if (finished)
            {
                self.searchButton.tag = 2;
            }
        }];
    }
    else if (self.searchButton.tag == 2)
    {
        self.searchView.becomeFirstResponder = NO;
        
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            // animations
            self.searchView.frame = self.hideSearchViewFrame;
            CGFloat transform = ((-M_PI * 3) / 4);
            self.searchButton.transform = CGAffineTransformRotate(self.searchButton.transform, transform);
            
            if (_resultsView)
            {
                [self.resultsView showResultsViewAnimated];
            }
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

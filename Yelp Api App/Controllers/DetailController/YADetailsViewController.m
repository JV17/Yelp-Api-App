//
//  YADetailsViewController.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YADetailsViewController.h"
#import "YADetailsView.h"


@interface YADetailsViewController () <YADetailsViewDelegate>

@property (nonatomic, strong) YADetailsView *detailsView;

@end


@implementation YADetailsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view gradientBackgroundWithFirstColor:[UIColor colorWithHexString:YARootControllerFirstBgColor] secondColor:[UIColor colorWithHexString:YARootControllerSecondBgColor]];
    
    [self.view addSubview:self.detailsView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Custom Accessors

- (YADetailsView *)detailsView
{
    if (!_detailsView)
    {
        _detailsView = [[YADetailsView alloc] initWithFrame:self.view.frame data:self.detailsData];
        _detailsView.delegate = self;
    }
    
    return _detailsView;
}


- (void)setDetailsData:(YAResultsData *)detailsData
{
    _detailsData = detailsData;
    
    if (self.detailsData)
    {
        self.detailsView.data = self.detailsData;
    }
}


#pragma mark - Helper Functions

- (void)backButtonPressed
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

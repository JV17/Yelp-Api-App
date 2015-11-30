//
//  YADetailsViewController.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YADetailsViewController.h"
#import "YADetailsView.h"


@interface YADetailsViewController ()

@property (nonatomic, strong) YADetailsView *detailsView;

@property (nonatomic, strong) UIButton *backButton;

@end


// back button
static CGFloat const kBackButtonLeftPadding = 10;
static CGFloat const kBackButtonTopPadding = 20;
static CGFloat const kBackButtonSize = 50;


@implementation YADetailsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view gradientBackgroundWithFirstColor:[UIColor colorWithHexString:YARootControllerFirstBgColor] secondColor:[UIColor colorWithHexString:YARootControllerSecondBgColor]];
    
    [self.view addSubview:self.detailsView];
    [self.view addSubview:self.backButton];
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


- (UIButton *)backButton
{
    if (!_backButton)
    {
        _backButton = [[UIButton alloc] initWithFrame:self.backButtonFrame];
        _backButton.backgroundColor = [UIColor blackColor];
        [_backButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];

    }
    
    return _backButton;
}


- (CGRect)backButtonFrame
{
    return CGRectMake(kBackButtonLeftPadding, kBackButtonTopPadding, kBackButtonSize, kBackButtonSize);
}


#pragma mark - Helper Functions

- (void)backButtonPressed
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

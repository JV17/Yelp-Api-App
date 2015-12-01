//
//  YADetailsViewController.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YADetailsViewController.h"
#import "YADetailsView.h"
#import "YACopyRightView.h"


@interface YADetailsViewController () <YADetailsViewDelegate>

@property (nonatomic, strong) YADetailsView *detailsView;

@property (nonatomic, strong) YACopyRightView *copyrightView;

@end


// copy right label
static CGFloat const kLabelHeight = 20;


@implementation YADetailsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view gradientBackgroundWithFirstColor:[UIColor colorWithHexString:YARootControllerFirstBgColor] secondColor:[UIColor colorWithHexString:YARootControllerSecondBgColor]];
    
    [self.view addSubview:self.detailsView];
    [self.view addSubview:self.copyrightView];
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
        _detailsView = [[YADetailsView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, (self.view.frame.size.height - (kLabelHeight * 1.5))) data:self.detailsData];
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


- (YACopyRightView *)copyrightView
{
    if (!_copyrightView)
    {
        _copyrightView = [[YACopyRightView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - kLabelHeight, self.view.frame.size.width, kLabelHeight) copyrightText:YACopyrightText copyrightImage:[UIImage imageNamed:YACopyrightImageName]];
        _copyrightView.backgroundColor = [UIColor clearColor];
    }
    
    return _copyrightView;
}


#pragma mark - Helper Functions

- (void)backButtonPressed
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

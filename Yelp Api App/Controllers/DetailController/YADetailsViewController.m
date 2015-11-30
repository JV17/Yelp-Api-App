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
        _detailsView = [[YADetailsView alloc] initWithFrame:self.view.frame data:self.data];
    }
    
    return _detailsView;
}


- (void)setData:(YAResultsData *)data
{
    _data = data;
    
    if (self.data)
    {
        self.detailsView.data = self.data;
    }
}

@end

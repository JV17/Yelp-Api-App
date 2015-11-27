//
//  YANetworkManager.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YANetworkManager.h"


@interface YANetworkManager()


@end


/**
 API v2.0 Keys.
 */
static NSString *const kIsYelpAppInstalledKey = @"yelp:";
static NSString *const kYelpConsumerKey = @"x_Z5a6af8VWQLmvMaxY_Iw";
static NSString *const kYelpConsumerSecret = @"WbhWCoFFQd0W2D73QACdU9Pi1gs";
static NSString *const kYelpToken = @"fn6YdCulEzqo-tMmuaAPZzgHetNy1hsp";
static NSString *const kYelpTokenSecret = @"JRgisR2SPIvCF1gcK9bfL3g1j3E";


@implementation YANetworkManager

- (BOOL)isYelpInstalled
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kIsYelpAppInstalledKey]];
}

@end

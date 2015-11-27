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


static NSString *const kIsYelpAppInstalledKey = @"yelp:";


@implementation YANetworkManager


#pragma mark - Helper functions

- (BOOL)isYelpInstalled
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kIsYelpAppInstalledKey]];
}

@end

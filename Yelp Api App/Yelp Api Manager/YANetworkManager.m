//
//  YANetworkManager.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YANetworkManager.h"


@implementation YANetworkManager

- (BOOL)isYelpInstalled
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:YAIsYelpAppInstalledKey]];
}

@end

//
//  NSURLRequest+OAuth.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "NSURLRequest+OAuth.h"
#import <TDOAuth/TDOAuth.h>


// API v2.0 Keys.
static NSString *const kYelpConsumerKey = @"x_Z5a6af8VWQLmvMaxY_Iw";
static NSString *const kYelpConsumerSecret = @"WbhWCoFFQd0W2D73QACdU9Pi1gs";
static NSString *const kYelpToken = @"fn6YdCulEzqo-tMmuaAPZzgHetNy1hsp";
static NSString *const kYelpTokenSecret = @"JRgisR2SPIvCF1gcK9bfL3g1j3E";

static NSString *const kRequestScheme = @"https";


@implementation NSURLRequest (OAuth)

+ (NSURLRequest *)requestWithHost:(NSString *)host path:(NSString *)path
{
    return [self requestWithHost:host path:path parameters:nil];
}


+ (NSURLRequest *)requestWithHost:(NSString *)host path:(NSString *)path parameters:(NSDictionary *)parameters
{
    return [TDOAuth URLRequestForPath:path
                        GETParameters:parameters
                               scheme:kRequestScheme
                                 host:host
                          consumerKey:kYelpConsumerKey
                       consumerSecret:kYelpConsumerSecret
                          accessToken:kYelpToken
                          tokenSecret:kYelpTokenSecret];
}

@end

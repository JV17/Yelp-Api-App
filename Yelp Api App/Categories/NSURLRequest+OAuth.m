//
//  NSURLRequest+OAuth.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "NSURLRequest+OAuth.h"
#import <TDOAuth/TDOAuth.h>


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
                          consumerKey:YAConsumerKey
                       consumerSecret:YAConsumerSecret
                          accessToken:YAToken
                          tokenSecret:YATokenSecret];
}

@end

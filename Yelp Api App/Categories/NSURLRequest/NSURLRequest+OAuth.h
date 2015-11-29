//
//  NSURLRequest+OAuth.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSURLRequest (OAuth)

/**
 Creates a NSURLRequest with all the OAuth headers field set with the host and path given to it.
 
 @param host
    The domain host.
 @param path
    The path on the domain host.
 
 @return
    A NSURLRequest instance with all the OAuth headers field set with the host and path given to it.
 */
+ (NSURLRequest *)requestWithHost:(NSString *)host path:(NSString *)path;


/**
 Creates a NSURLRequest with all the OAuth headers field set with the host, path and query parameters given to it.
 
 @param host
    The domain host.
 @param path
    The path on the domain host.
 @param parameters
    The query parameters.
 
 @return
    A NSURLRequest instance with all the OAuth headers field set with the host, path and query parameters given to it.
 */
+ (NSURLRequest *)requestWithHost:(NSString *)host path:(NSString *)path parameters:(NSDictionary *)parameters;

@end

//
//  YANetworkManager.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface YANetworkManager : NSObject

#pragma mark - Public Methods

/**
 Query the Yelp's API with a given term and location.
 
 @param term 
    The term of the search, e.g: dinner.
 @param location 
    The location in which the term should be searched for, e.g: Toronto, ON.
 @param completionHandler
    A completion block that takes a @NSDictionary and a @NSError.
 */
- (void)queryBusinessInformationWithTerm:(NSString *)term location:(NSString *)location completionHandler:(void (^)(NSDictionary *jsonDictionary, NSError *error))completionHandler;


/**
 Query the Yelp's API with a given business id.
 
 @param businessID
    The business id from Yelp's response.
 @param completionHandler
    A completion block that takes a @NSDictionary and a @NSError.
 */
- (void)queryBusinessInformationWithBusinessId:(NSString *)businessID completionHandler:(void (^)(NSDictionary *jsonDictionary, NSError *error))completionHandler;


/**
 Tells if the current user has Yelp's app installed in their device.
 
 @return
    A Boolean indicating if the user has installed Yelp's app.
 */
- (BOOL)isYelpInstalled;


@end

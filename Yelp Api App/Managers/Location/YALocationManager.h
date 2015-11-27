//
//  YALocationManager.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLLocationManager;

@protocol YALocationManagerDelegate <NSObject>

/**
 This delegate tells you when we have received a new location update with city, state, country and country code.
 
 @param city
    The current location city.
 @param state
    The current location state.
 @param country
    The current location country.
 @param countryCode
    The current location country code.
 */
- (void)locationFinishedUpdatingWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country countryCode:(NSString *)countryCode;


/**
 This delegate tells you when we have received an error from a new location request.
 
 @param error
    The errer generated from the location request.
 @param
    A user friendly error message.
 */
- (void)locationFinishedWithError:(NSError *)error errorMessage:(NSString *)errorMessages;

@end


@interface YALocationManager : NSObject

@property (nonatomic, strong, readonly) CLLocationManager *locationManager;

@property (nonatomic, weak) id <YALocationManagerDelegate> delegate;


/**
 Starts a new location request.
 */
- (void)requestLocation;

@end

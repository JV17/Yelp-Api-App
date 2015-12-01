//
//  YALocationManager.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLLocationManager, YALocation;

@protocol YALocationManagerDelegate <NSObject>

/**
 This delegate tells you when we have received a new location update with city, state, country and country code.
 
 @param location
    The current user's location E.g. city, state, country and country code.
 */
- (void)locationFinishedUpdatingWithLocation:(YALocation *)location;


/**
 This delegate tells you when we have received an error from a new location request.
 
 @param error
    The errer generated from the location request.
 @param errorMessage
    A user friendly error message.
 */
- (void)locationFinishedWithError:(NSError *)error errorMessage:(NSString *)errorMessage;

@end


@interface YALocationManager : NSObject

/**
 The current location manager use to load user's location.
 */
@property (nonatomic, strong, readonly) CLLocationManager *locationManager;


/**
 The current user's location.
 */
@property (nonatomic, strong, readonly) YALocation *location;


/**
 Location manager delegate.
 */
@property (nonatomic, weak) id <YALocationManagerDelegate> delegate;


/**
 Starts a new location request.
 */
- (void)requestLocation;

@end

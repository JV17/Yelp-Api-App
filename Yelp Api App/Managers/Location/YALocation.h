//
//  YALocation.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-28.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YALocation : NSObject

#pragma mark - Properties

/**
 The user's current city.
 */
@property (nonatomic, strong) NSString *city;


/**
 The user's current state.
 */
@property (nonatomic, strong) NSString *state;


/**
 The user's current country.
 */
@property (nonatomic, strong) NSString *country;


/**
 The user's current iso country code.
 */
@property (nonatomic, strong) NSString *countryCode;


#pragma mark - Custom Initializer

/**
 Custom initializer for the user current location data. Contains user's current city, state, country and iso country code.
 
 @param city
    The user's current city.
 @param state
    The user's current state.
 @param country
    The user's current country.
 @param countryCode
    The user's current iso country code.
 
 @return
    An instancetpye with the user's location information.
 */
- (instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country countryCode:(NSString *)countryCode;

@end

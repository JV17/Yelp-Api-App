//
//  NSDictionary+Addons.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-28.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (Addons)

#pragma mark - Response Dictionary

/**
 Loads a dictionary with specific prefix keys from a specfied array of dictionaries. This method will add a number base on each element from the Array dictionary.
 
 @param keyPrefix
    The prefix key to be use as the new dictionary keys E.g. business. Resulting in business1, business2...
 @param arrayDictionary
    The array containing dictionaries to be extracted to different keys.
 
 @return
    A dictionary with dictionaries and specifies keys.
 */
+ (instancetype)responseDictionaryWithKeyPrefix:(NSString *)keyPrefix arrayDictionary:(NSArray *)arrayDictionary;


#pragma mark - Error Dictionary

/**
 Builds a dictionary for an @NSError with description, reason and suggestion.
 
 @param description
    The description of the error.
 @param reason
    The reason of the error.
 @param suggestion
    The suggestion of the error.
 
 @return
    The error dictionary with description, reason and suggestion.
 */
+ (instancetype)errorDictionaryWithDescription:(NSString *)description reason:(NSString *)reason suggestion:(NSString *)suggestion;

@end

//
//  NSArray+Addons.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YAResultsData;

@interface NSArray (Addons)

/**
 Helper function to extract all content from dictionary and stores it in a @NSArray of objects type @YAResultsData.
 
 @param dictionary
    The dictonary from Yelp's API response.
 
 @return
    The @YAResultsData with the extracted data.
 */
+ (NSArray<YAResultsData *> *)arrayFromResultsDictionary:(NSDictionary *)dictionary;

@end

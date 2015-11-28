//
//  NSDictionary+Error.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-28.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (Error)

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

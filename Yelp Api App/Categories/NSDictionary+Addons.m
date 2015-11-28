//
//  NSDictionary+Error.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-28.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "NSDictionary+Error.h"


@implementation NSDictionary (Error)

+ (instancetype)errorDictionaryWithDescription:(NSString *)description reason:(NSString *)reason suggestion:(NSString *)suggestion
{
    return @{NSLocalizedDescriptionKey: NSLocalizedString(description, nil),
             NSLocalizedFailureReasonErrorKey: NSLocalizedString(reason, nil),
             NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(suggestion, nil)};
}

@end

//
//  NSDictionary+Addons.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-28.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "NSDictionary+Addons.h"


@implementation NSDictionary (Addons)

#pragma mark - Response Dictionary

+ (instancetype)responseDictionaryWithKeyPrefix:(NSString *)keyPrefix arrayDictionary:(NSArray *)arrayDictionary
{
    if (!arrayDictionary.count || !keyPrefix.length)
    {
        return nil;
    }
    
    NSMutableDictionary *responseDictionary = [[NSMutableDictionary alloc] initWithCapacity:arrayDictionary.count];
    NSInteger index = 0;
    
    for (NSDictionary *dictionary in arrayDictionary)
    {
        [responseDictionary setObject:dictionary forKey:[NSString stringWithFormat:@"%@%zd", keyPrefix, (index + 1)]];
        index++;
    }
    
    return [responseDictionary copy];
}


#pragma mark - Error Dictionary

+ (instancetype)errorDictionaryWithDescription:(NSString *)description reason:(NSString *)reason suggestion:(NSString *)suggestion
{
    return @{NSLocalizedDescriptionKey: NSLocalizedString(description, nil),
             NSLocalizedFailureReasonErrorKey: NSLocalizedString(reason, nil),
             NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(suggestion, nil)};
}

@end

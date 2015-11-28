//
//  YALocation.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-28.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YALocation.h"


@implementation YALocation

- (instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country countryCode:(NSString *)countryCode
{
    self = [super init];
    
    if (self)
    {
        _city = city;
        _state = state;
        _country = country;
        _countryCode = countryCode;
    }
    
    return self;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"User's current location: city:%@, state:%@, country:%@, iso country code:%@", self.city, self.state, self.country, self.countryCode];
}

@end

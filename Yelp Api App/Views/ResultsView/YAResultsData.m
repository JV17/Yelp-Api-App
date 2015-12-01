//
//  YAResultsData.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YAResultsData.h"


@implementation YAResultsData

- (instancetype)initWithName:(NSString *)name imagePreview:(UIImage *)image ratingImage:(UIImage *)ratingImage businessCategory:(NSString *)category phoneNumber:(NSString *)phone address:(NSString *)address review:(NSString *)review
{
    self = [super init];
    
    if (self)
    {
        _imagePreview = image;
        _ratingImage = ratingImage;
        _name = name;
        _businessCategory = category;
        _phoneNumber = phone;
        _address = address;
        _review = review;
    }
    
    return self;
}

@end

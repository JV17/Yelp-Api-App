//
//  UIColor+Hex.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (Hex)

/**
 Converts a hex string color to UIColor.
 
 @param stringToConvert
    The hex string color to convert.
 
 @return
    The new color.
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;


/**
 Converts a UInt32 hex color to UIColor.
 
 @param hex
    The UInt32 hex color to convert.
 
 @return
    The new color.
 */
+ (UIColor *)colorWithRGBHex:(UInt32)hex;

@end

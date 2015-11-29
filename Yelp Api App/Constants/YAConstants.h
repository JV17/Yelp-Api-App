//
//  YAConstants.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef YAConstants_h
#define YAConstants_h

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

// generic error
FOUNDATION_EXTERN NSString *const YAErrorDomain;
FOUNDATION_EXTERN NSInteger const YAErrorCode;


// NSURL Request Category
FOUNDATION_EXTERN NSString *const YAConsumerKey;
FOUNDATION_EXTERN NSString *const YAConsumerSecret;
FOUNDATION_EXTERN NSString *const YAToken;
FOUNDATION_EXTERN NSString *const YATokenSecret;


FOUNDATION_EXTERN NSString *const YABusinessKey;


// Fonts
FOUNDATION_EXTERN NSString *const YALatoHairlineFont;
FOUNDATION_EXTERN NSString *const YALatoLightFont;
FOUNDATION_EXTERN NSString *const YALatoRegular;
FOUNDATION_EXTERN CGFloat const YADefautlFontSize;


// Copyright
FOUNDATION_EXTERN NSString *const YACopyrightText;
FOUNDATION_EXTERN NSString *const YACopyrightImageName;


// Demo
FOUNDATION_EXTERN NSString *const YADemoText;
FOUNDATION_EXTERN NSString *const YADemoImageName;


// Root Controller
FOUNDATION_EXTERN NSString *const YARootControllerFirstBgColor;
FOUNDATION_EXTERN NSString *const YARootControllerSecondBgColor;


#endif /* YAConstants_h */

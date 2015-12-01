//
//  YAResultsData.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YAResultsData : NSObject

#pragma mark - Properties

/**
 The business name.
 */
@property (nonatomic, strong) NSString *name;


/**
 The business image preview.
 */
@property (nonatomic, strong) UIImage *imagePreview;


/**
 The business rating image.
 */
@property (nonatomic, strong) UIImage *ratingImage;


/**
 The business category.
 */
@property (nonatomic, strong) NSString *businessCategory;


/**
 The business phone number.
 */
@property (nonatomic, strong) NSString *phoneNumber;


/**
 The business address.
 */
@property (nonatomic, strong) NSString *address;


/**
 The business latest review.
 */
@property (nonatomic, strong) NSString *review;


#pragma mark - Intializers

/**
 Custom initializer for @YAResultsData with business name, image preview, category, phone number, address and short description.
 
 @param name
    The business name.
 @param image
    The business image preview.
 @param ratingImage
    The business rating image.
 @param category
    The business category.
 @param phone
    The business phone number.
 @param address
    The business address.
 @param review
    The business latest review.
 
 @return
    An instancetype of @YAResultsData with image preview, ratingImage, business name, category, phone number, address and short review.
 */
- (instancetype)initWithName:(NSString *)name imagePreview:(UIImage *)image ratingImage:(UIImage *)ratingImage businessCategory:(NSString *)category phoneNumber:(NSString *)phone address:(NSString *)address review:(NSString *)review;


@end

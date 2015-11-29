//
//  UIImage+Addons.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (Addons)

/**
 Returns a new scaled image from specified image and desired width.
 
 @param sourceImage
    The image to scaled.
 @param newWidth
    The new desired width.
 
 @return
    The new scaled image.
 */
+ (UIImage *)imageWithSourceImage:(UIImage *)sourceImage scaledToWidth:(CGFloat)newWidth;


+ (UIImage *)imageWithURL:(NSString *)url;

@end

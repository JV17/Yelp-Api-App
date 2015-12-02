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


/**
 Retrives an image from provided url in the background thread. 
 
 @param url
    The image url.
 @param completion
    The completion block to return downloaded image or error.
 */
+ (void)imageWithURL:(NSString *)url completion:(void (^)(UIImage *image, NSError *error))completion;

@end

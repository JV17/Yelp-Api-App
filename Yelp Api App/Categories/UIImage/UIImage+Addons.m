//
//  UIImage+Addons.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "UIImage+Addons.h"


@implementation UIImage (Addons)

+ (UIImage *)imageWithSourceImage:(UIImage *)sourceImage scaledToWidth:(CGFloat)newWidth
{
    CGFloat oldWidth = sourceImage.size.width;
    CGFloat scaleFactor = newWidth / oldWidth;
    CGFloat newHeight = sourceImage.size.height * scaleFactor;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(newWidth, newHeight), NO, 0);
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end

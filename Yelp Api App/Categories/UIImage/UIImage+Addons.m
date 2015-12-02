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


+ (void)imageWithURL:(NSString *)url completion:(void (^)(UIImage *image, NSError *error))completion
{
    if (!url.length)
    {
        return;
    }
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    
    dispatch_async(queue, ^{
    
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (!imageData)
            {
                NSDictionary *userInfo = [NSDictionary errorDictionaryWithDescription:@"Error retrieving image from url."
                                                                               reason:@"No data from image url."
                                                                           suggestion:@"Check if provided url is correct."];
                
                NSError *noDataError = [NSError errorWithDomain:@"No Image Data" code:400 userInfo:userInfo];
                completion(nil, noDataError);
            }
            else
            {
                UIImage *image = [UIImage imageWithData:imageData];
                completion(image, nil);
            }
        });
    });
}

@end

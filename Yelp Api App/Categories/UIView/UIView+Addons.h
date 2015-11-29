//
//  UIView+Addons.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (Addons)

/**
 Applies a gradient background color to view with desired two colors.
 
 @param firstColor
    The first color for the gradient background.
 @param secondColor
    The second color for the gradient background.
 */
- (void)gradientBackgroundWithFirstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor;


/**
 Removes gradient background from view.
 */
- (void)removeGradientLayerFromView;

@end

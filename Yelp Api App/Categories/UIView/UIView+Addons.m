//
//  UIView+Addons.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "UIView+Addons.h"


@implementation UIView (Addons)

- (void)gradientBackgroundWithFirstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor
{
    [self removeGradientLayerFromView];
    
    CAGradientLayer *newGradient = [CAGradientLayer layer];
    newGradient.frame = self.frame;
    newGradient.colors = @[(id)firstColor.CGColor, (id)secondColor.CGColor];
    
    [self.layer insertSublayer:newGradient atIndex:0];
}


- (void)removeGradientLayerFromView;
{
    CAGradientLayer *layerToRemove;
    
    for (CALayer *aLayer in self.layer.sublayers)
    {
        if ([aLayer isKindOfClass:[CAGradientLayer class]])
        {
            layerToRemove = (CAGradientLayer *)aLayer;
        }
    }
    
    [layerToRemove performSelector:@selector(removeFromSuperlayer)];
}

@end

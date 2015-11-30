//
//  YADemoView.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YADemoView : UIView

#pragma mark - Properties

/**
 The demo image to be displayed on the view E.g. brand logo.
 */
@property (nonatomic, strong) UIImage *demoImage;


/**
 The demo name to be displayed on the view E.g. "Demo App".
 */
@property (nonatomic, strong) NSString *demoName;


#pragma mark - Custom Initializers

/**
 Custom initializer with frame, demo image to display and demo name.
 
 @param frame
    The geometry where the view will be drawn.
 @param demoImage
    The image to be displayed on the demo view. E.g. brand logo.
 @param demoName
    The app demo name E.g. "Demo App".
 
 @return
    An instancetype of @UIView displaying the demo image and demo name.
 */
- (instancetype)initWithFrame:(CGRect)frame demoImage:(UIImage *)demoImage demoName:(NSString *)demoName;

@end

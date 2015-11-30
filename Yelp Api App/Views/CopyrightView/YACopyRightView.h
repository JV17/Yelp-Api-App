//
//  YACopyRightView.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YACopyRightView : UIView

#pragma mark - Properties

/**
 The copyright text to show.
 */
@property (nonatomic, strong) NSString *copyrightText;


/**
 The copyright image to show.
 */
@property (nonatomic, strong) UIImage *copyrightImage;


/**
 The content view width.
 */
@property (nonatomic, assign, readonly) CGFloat contentViewWidth;


#pragma mark - Custom Intializers

/**
 Custom initializer with copyright image. 
 
 @param copyrightText
    The text to be displayed for copyright.
 @param copyrightImage
    The image to be displayed for copyright.
 
 @return
    An instancetype with copyright text and image.
 */
- (instancetype)initWithFrame:(CGRect)frame copyrightText:(NSString *)copyrightText copyrightImage:(UIImage *)copyrightImage;

@end

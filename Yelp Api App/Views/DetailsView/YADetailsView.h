//
//  YADetailsView.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YAResultsData;

@protocol YADetailsViewDelegate <NSObject>

/**
 Tells when the user has pressed the back button.
 */
- (void)backButtonPressed;

@end


@interface YADetailsView : UIView

/**
 The details data to be displayed by the view.
 */
@property (nonatomic, strong) YAResultsData *data;

@property (nonatomic, weak) id <YADetailsViewDelegate> delegate;

/**
 Custom initializer with frame and view data.
 
 @param frame
    The @CGGeometry where the view will be drawn.
 @param data
    The data to be displayed by the view.
 
 @return
    An instancetype of @YADetailsView.
 */
- (instancetype)initWithFrame:(CGRect)frame data:(YAResultsData *)data;

@end

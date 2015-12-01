//
//  YASearchView.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-28.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol YASearchViewDelegate <NSObject>

/**
 Tells the string searched by the user.
 
 @param searchString
    The string searched by the user.
 */
- (void)searchViewFinishedWithSearchString:(NSString *)searchString;


/**
 Tells when something went wrong in a search.
 
 @param error
    The error found.
 @param errorMessage
    The user friendly error message.
 */
- (void)searchViewFinishedWithError:(NSError *)error errorMessage:(NSString *)errorMessage;

@end


@interface YASearchView : UIView

/**
 Triggers the search view to become first responder or not.
 */
@property (nonatomic, assign) BOOL becomeFirstResponder;


/**
 Clears all input from text field.
 */
@property (nonatomic, assign) BOOL clearTextField;


@property (nonatomic, weak) id <YASearchViewDelegate> delegate;

@end

//
//  YAResultsView.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YAResultsData;


@protocol YAResultsViewDelegate <NSObject>

/**
 Tells the selected business with business data.
 
 @param data
    The selected business data.
 */
- (void)resultsViewSelectedBusinessWithData:(YAResultsData *)data;

@end


@interface YAResultsView : UIView

#pragma mark - Properties

/**
 The results array of @YAResultsData.
 */
@property (nonatomic, strong) NSArray<YAResultsData *> *data;


@property (nonatomic, weak) id <YAResultsViewDelegate> delegate;


#pragma mark - Initializers

/**
 Custom initializer with frame and results array of @YAResultsData.
 
 @param frame
    The @CGGeometry where the view drawn.
 @param results
    The results array of @YAResultsData.
 
 @return
    An instancetype of @YAResutlsView.
 */
- (instancetype)initWithFrame:(CGRect)frame resultsData:(NSArray<YAResultsData *> *)results;


#pragma mark - Hide & Show

/**
 Shows the results view animated. Fade in animation.
 */
- (void)showResultsViewAnimated;


/**
 Hides the results view animated. Fade out animation.
 */
- (void)hideResultsViewAnimated;

@end

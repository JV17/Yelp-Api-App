//
//  YADetailsViewController.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YAResultsData;

@interface YADetailsViewController : UIViewController

/**
 The details data to be displayed by the controller.
 */
@property (nonatomic, strong) YAResultsData *detailsData;

@end

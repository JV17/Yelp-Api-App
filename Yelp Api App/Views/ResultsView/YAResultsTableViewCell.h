//
//  YAResultsTableViewCell.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YAResultsData;

@interface YAResultsTableViewCell : UITableViewCell

/**
 The data to load the cell.
 */
@property (nonatomic, strong) YAResultsData *data;

@end

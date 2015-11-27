//
//  YANetworkManager.h
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface YANetworkManager : NSObject

/**
 Tells if the current user has Yelp's app installed in their device.
 
 @return
    A Boolean indicating if the user has installed Yelp's app.
 */
- (BOOL)isYelpInstalled;

@end

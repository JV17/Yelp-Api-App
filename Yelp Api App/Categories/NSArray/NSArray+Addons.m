//
//  NSArray+Addons.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-29.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "NSArray+Addons.h"
#import "YAResultsData.h"


// Yelp's API key values.
static NSString *const kNameKey = @"name";
static NSString *const kImagePreviewKey = @"image_url";
static NSString *const kBusinessCategoryKey = @"categories";
static NSString *const kPhoneNumberKey = @"display_phone";
static NSString *const kLocationKey = @"location";
static NSString *const kAddressKey = @"display_address";
static NSString *const kReviewKey = @"snippet_text";
static NSString *const kRatingImageKey = @"rating_img_url";


@implementation NSArray (Addons)

+ (NSArray<YAResultsData *> *)arrayFromResultsDictionary:(NSDictionary *)dictionary
{
    if (!dictionary.count)
    {
        return nil;
    }
        
    NSMutableArray<YAResultsData *> *resultsArray = [[NSMutableArray alloc] initWithCapacity:dictionary.count];
    
    for (NSString *key in dictionary)
    {
        if ([dictionary objectForKey:key] && ![[dictionary objectForKey:key] isEqual:[NSNull class]])
        {
            NSDictionary *businessDic = dictionary[key];
            
            YAResultsData *data = [[YAResultsData alloc] init];
            data.name = businessDic[kNameKey];
            
            dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                data.imagePreview = [UIImage imageWithURL:businessDic[kImagePreviewKey]];
            });
            
            dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                data.ratingImage = [UIImage imageWithURL:businessDic[kRatingImageKey]];
            });
            
            NSArray *categories = businessDic[kBusinessCategoryKey];
            
            if (categories.count)
            {
                NSArray *category = categories[0];
                
                if (category.count)
                {
                    data.businessCategory = category[0];
                }
            }
            
            data.phoneNumber = businessDic[kPhoneNumberKey];
            
            NSDictionary *addressDic = businessDic[kLocationKey];
            NSArray *addressArray = addressDic[kAddressKey];
            
            if (addressArray.count > 1)
            {
                data.address = [NSString stringWithFormat:@"%@,%@", addressArray[0], addressArray[1]];
            }
            else if (addressArray.count == 1)
            {
                data.address = [NSString stringWithFormat:@"%@", addressArray[0]];
            }
            
            data.review = businessDic[kReviewKey];
            
            [resultsArray addObject:data];
        }
    }
    
    return [resultsArray copy];
}

@end

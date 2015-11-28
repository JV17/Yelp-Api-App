//
//  YANetworkManager.m
//  Yelp Api App
//
//  Created by Jorge Valbuena on 2015-11-27.
//  Copyright © 2015 Jorge Valbuena. All rights reserved.
//

#import "YANetworkManager.h"


static NSString *const kIsYelpAppInstalledKey = @"yelp:";

// Default paths and search terms.
static NSString *const kAPIHost = @"api.yelp.com";
static NSString *const kSearchPath = @"/v2/search/";
static NSString *const kBusinessPath = @"/v2/business/";
static NSString *const kSearchLimit = @"10";

static NSString *const kSearchKey = @"businesses";
static NSInteger const kStatusCode = 200;
static NSString *const kBusinessIdKey = @"id";


@implementation YANetworkManager

#pragma mark - Query Functions

- (void)queryBusinessInformationWithTerm:(NSString *)term location:(NSString *)location completionHandler:(void (^)(NSDictionary *jsonDictionary, NSError *error))completionHandler
{
    if (!term.length || !location.length)
    {
        NSDictionary *userInfo = [NSDictionary errorDictionaryWithDescription:@"We can't make a request without a term or location."
                                                                       reason:@"No data for required fields term and location."
                                                                   suggestion:@"Please provide a tearm and locaion."];
        
        NSError *noDataError = [NSError errorWithDomain:YAErrorDomain code:YAErrorCode userInfo:userInfo];
        completionHandler(nil, noDataError);
        
        return;
    }
    
    NSURLRequest *searchRequest = [self searchRequestWithTerm:term location:location];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithRequest:searchRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (!error && httpResponse.statusCode == kStatusCode)
        {
            NSDictionary *searchResponseJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray *businessArray = searchResponseJSON[kSearchKey];
            
            if (businessArray.count)
            {
                NSDictionary *businessDictionary = [NSDictionary responseDictionaryWithKeyPrefix:YABusinessKey arrayDictionary:businessArray];
                NSLog(@"%@", businessDictionary);
                
                completionHandler(businessDictionary, error);                
            }
            else
            {
                completionHandler(nil, error); // No business was found
            }
        }
        else
        {
            completionHandler(nil, error); // An error happened or the HTTP response is not a 200 OK
        }
    }]
     resume];
}


- (void)queryBusinessInformationWithBusinessId:(NSString *)businessID completionHandler:(void (^)(NSDictionary *jsonDictionary, NSError *error))completionHandler
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *businessInfoRequest = [self businessInformationRequestWithID:businessID];
    
    [[session dataTaskWithRequest:businessInfoRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (!error && httpResponse.statusCode == kStatusCode)
        {
            NSDictionary *businessResponseJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            completionHandler(businessResponseJSON, error);
        }
        else
        {
            completionHandler(nil, error);
        }
    }]
     resume];
}


#pragma mark - Build Request

/**
 Builds a request to hit the search endpoint with the given parameters.
 
 @param term
    The term of the search, e.g: dinner.
 @param location
    The location request, e.g: Toronto, ON.
 
 @return
    The NSURLRequest needed to perform the search
 */
- (NSURLRequest *)searchRequestWithTerm:(NSString *)term location:(NSString *)location
{
    NSDictionary *parameters = @{@"term": term,
                                 @"location": location,
                                 @"limit": kSearchLimit};
    
    return [NSURLRequest requestWithHost:kAPIHost path:kSearchPath parameters:parameters];
}


/**
 Builds a request to hit the business endpoint with the given business ID.
 
 @param businessID
    The id of the business for which we request informations.
 
 @return
    The NSURLRequest needed to query the business info.
 */
- (NSURLRequest *)businessInformationRequestWithID:(NSString *)businessID
{
    NSString *businessPath = [NSString stringWithFormat:@"%@%@", kBusinessPath, businessID];
    
    return [NSURLRequest requestWithHost:kAPIHost path:businessPath];
}


#pragma mark - Helper functions

- (BOOL)isYelpInstalled
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:kIsYelpAppInstalledKey]];
}


@end

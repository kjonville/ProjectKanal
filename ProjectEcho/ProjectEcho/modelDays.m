//
//  modelDays.m
//  ProjectEcho
//
//  Created by Ricky Leemans on 21/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import "modelDays.h"
#import "DaysDb.h"

@interface modelDays ()

 @property NSMutableData *downloadedDays;

@end

@implementation modelDays

- (void)downloadItems2{
    
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://localhost/~rickyleemans/Integration/serviceDays.php"];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    self.downloadedDays = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [self.downloadedDays appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_items = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:self.downloadedDays options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        DaysDb *days = [[DaysDb alloc] init];
        days.IDday = jsonElement[@"DayID"];
        days.DayName = jsonElement[@"Dayname"];
        
        // Add this question to the locations array
        [_items addObject:days];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloadedDays:_items];
    }
}
@end

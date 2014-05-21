//
//  modelStagedays.m
//  ProjectEcho
//
//  Created by Ricky Leemans on 21/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import "modelStagedays.h"


@interface modelStagedays ()

@property NSMutableData *downloadedStagedays;

@end

@implementation modelStagedays

- (void)downloadItems3{
    
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://localhost/~rickyleemans/Integration/serviceStagedays.php"];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    self.downloadedStagedays = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [self.downloadedStagedays appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_items = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:self.downloadedStagedays options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        StagedaysDb *stagedays = [[StagedaysDb alloc] init];
        stagedays.Start = jsonElement[@"Start"];
        stagedays.Stop = jsonElement[@"Stop"];
        stagedays.DayID = jsonElement[@"DayID"];
        stagedays.EventID = jsonElement[@"EventID"];
        
        // Add this question to the locations array
        [_items addObject:stagedays];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloadedStagedays:_items];
    }
}
@end


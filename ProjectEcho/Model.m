//
//  Model.m
//  ProjectEcho
//
//  Created by Ricky Leemans on 20/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import "Model.h"
#import "StagesDb.h"

@interface Model()
{
    NSMutableData *_downloadedData;
}
@end

@implementation Model

- (void)downloadItems{
    
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://localhost/~rickyleemans/Integration/service.php"];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_items = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        StagesDb *stages = [[StagesDb alloc] init];
        stages.IDevent = jsonElement[@"EventID"];
        stages.stageTitle = jsonElement[@"Title"];
        stages.description = jsonElement[@"Description"];
        stages.latitude = jsonElement[@"Latitude"];
        stages.longitude = jsonElement[@"Longitude"];
        stages.facebook = jsonElement[@"facebookLink"];
        stages.twitter = jsonElement[@"twitterLink"];
        stages.imageBack = jsonElement[@"fotoBack"];
        stages.imageWidth = jsonElement[@"fotoLang"];
        stages.genre = jsonElement[@"Genre"];
        stages.groupName = jsonElement[@"GroupName"];
        
        // Add this question to the locations array
        [_items addObject:stages];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_items];
    }
}
@end

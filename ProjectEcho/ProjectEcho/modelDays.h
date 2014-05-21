//
//  modelDays.h
//  ProjectEcho
//
//  Created by Ricky Leemans on 21/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DaysDb.h"

@protocol ModelDaysProtocol <NSObject>

- (void)itemsDownloadedDays:(NSArray *)items;

@end


@interface modelDays : NSObject  <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<ModelDaysProtocol> delegate;

- (void)downloadItems2;

@end



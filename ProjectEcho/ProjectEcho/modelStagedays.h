//
//  modelStagedays.h
//  ProjectEcho
//
//  Created by Ricky Leemans on 21/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StagedaysDb.h"

@protocol ModelStagedaysProtocol <NSObject>

- (void)itemsDownloadedStagedays:(NSArray *)items;

@end


@interface modelStagedays : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<ModelStagedaysProtocol> delegate;

- (void)downloadItems3;

@end


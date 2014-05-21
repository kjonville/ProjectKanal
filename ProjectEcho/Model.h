//
//  Model.h
//  ProjectEcho
//
//  Created by Ricky Leemans on 20/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StagesDb.h"


@protocol ModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface Model : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<ModelProtocol> delegate;

- (void)downloadItems;

@end



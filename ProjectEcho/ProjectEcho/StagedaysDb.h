//
//  StagedaysDb.h
//  ProjectEcho
//
//  Created by Ricky Leemans on 21/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StagedaysDb : NSObject


@property  NSString *DayID;
@property (nonatomic, strong) NSString *EventID;
@property (nonatomic, strong) NSString *Start;
@property (nonatomic, strong) NSString *Stop;

@end

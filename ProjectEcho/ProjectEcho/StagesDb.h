//
//  StagesDb.h
//  ProjectEcho
//
//  Created by Ricky Leemans on 20/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StagesDb : NSObject

@property   NSString *IDevent;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *stageTitle;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *facebook;
@property (nonatomic, strong) NSString *twitter;
@property (nonatomic, strong) NSString *imageBack;
@property (nonatomic, strong) NSString *imageWidth;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *groupName;

@end

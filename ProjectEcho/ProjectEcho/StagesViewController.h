//
//  StagesViewController.h
//  ProjectEcho
//
//  Created by Ricky Leemans on 19/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventDetailViewController.h"

@interface StagesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section;

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end

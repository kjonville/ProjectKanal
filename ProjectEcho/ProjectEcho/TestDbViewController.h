//
//  TestDbViewController.h
//  ProjectEcho
//
//  Created by Ricky Leemans on 20/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface TestDbViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ModelProtocol>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;


@end

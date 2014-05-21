//
//  TestDbViewController.m
//  ProjectEcho
//
//  Created by Ricky Leemans on 20/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import "TestDbViewController.h"


@interface TestDbViewController ()

@property Model *model;
@property NSArray *feedItems;

@end

@implementation TestDbViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Set this view controller object as the delegate and data source for the table view
    //self.listTableView.delegate = self;
   // self.listTableView.dataSource = self;
    
    // Create array object and assign it to _feedItems variable
    self.feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    self.model = [[Model alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    self.model.delegate = self;
    
    // Call the download items method of the home model object
    [self.model downloadItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    self.feedItems = items;
    
    // Reload the table view
    [self.listTableView reloadData];
    
    
    StagesDb *item = self.feedItems[0];
    StagesDb *item2 = self.feedItems[1];
    
    
    NSLog(@"%@", item.stageTitle);
    NSLog(@"%@", item2.stageTitle);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of feed items (initially 0)
    return self.feedItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the location to be shown
    StagesDb *item = self.feedItems[indexPath.row];
    
    // Get references to labels of cell
    myCell.textLabel.text = item.genre;
    
    return myCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

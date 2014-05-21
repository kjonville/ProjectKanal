//
//  StagesViewController.m
//  ProjectEcho
//
//  Created by Ricky Leemans on 19/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import "StagesViewController.h"

@interface StagesViewController ()

@property NSDictionary* data;


@end

@implementation StagesViewController

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
    
    self.data = [NSDictionary dictionaryWithObjectsAndKeys: @"Ricky", @"1", @"Sam", @"2", @"michaël", @"3",  @"Daan", @"4",   @"Brent", @"5",   @"Johan", @"6",   @"Gandibleux", @"7",   @"Pinda", @"8",   @"lol", @"9",  nil];
    
    [self.table reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stageCell"];
    
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"stageCell"];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"stageCell"];
    }
    
    cell.textLabel.text = self.data.allValues[indexPath.row];
    cell.detailTextLabel.text = self.data.allKeys[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EventDetailViewController *diff = [self.storyboard instantiateViewControllerWithIdentifier:@"EventDetailViewController"];
    diff.titlee = self.data.allValues [indexPath.row];
    //[self.navigationController pushViewController:diff animated:YES];
    [self presentViewController:diff animated:YES completion:nil];
    
    //[self performSegueWithIdentifier:@"StagesToDetail" sender:self.table];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
 if([segue.identifier isEqualToString:@"StagesToDetail"]){
     EventDetailViewController *event = segue.destinationViewController;
     
     UITableViewCell *selectedCell = (UITableViewCell *)sender;
     event.titlee = selectedCell.textLabel.text;
     //event.image = self.imgName[self.index];
     
     NSLog(@"%@", @"lol");
 }

}
*/

@end

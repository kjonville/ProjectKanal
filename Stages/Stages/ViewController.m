//
//  ViewController.m
//  Stages
//
//  Created by MEERT Kenneth (s) on 21/05/14.
//  Copyright (c) 2014 Kenneth Meert. All rights reserved.
//

#import "ViewController.h"
#import "StagesCellTableViewCell.h"

@interface ViewController ()
{
    NSArray *eventNames;
    NSArray *eventTijd;
    NSArray *eventGenre;
    NSArray *eventBanners;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	eventNames = [NSArray arrayWithObjects:@"Sculpt Me Point", @"Lomo Wall", @"Les Quais", @"Above under Inbetween", @"Sculpt Me Point", @"Lomo Wall", @"Les Quais", @"Above under Inbetween", @"Sculpt Me Point", @"Lomo Wall", @"Les Quais", @"Above under Inbetween", nil];
    
    eventTijd = [NSArray arrayWithObjects:@"18.00 - 20.00", @"19.20 - 21.00", @"18.00 - 19.30", @"20.00", @"18.00 - 20.00", @"19.20 - 21.00", @"18.00 - 19.30", @"20.00", @"18.00 - 20.00", @"19.20 - 21.00", @"18.00 - 19.30", @"20.00", nil];
    
    eventGenre = [NSArray arrayWithObjects:@"Performance", @"Walks", @"Stories", @"Performance", @"Performance", @"Walks", @"Stories", @"Performance", @"Performance", @"Walks", @"Stories", @"Performance", nil];
    
    eventBanners = [NSArray arrayWithObjects:@"sculpt-me-point-banner.png", @"lomo-wall-banner.png", @"les-quais-banner.png", @"above-under-inbetween-banner.png", @"sculpt-me-point-banner.png", @"lomo-wall-banner.png", @"les-quais-banner.png", @"above-under-inbetween-banner.png", @"sculpt-me-point-banner.png", @"lomo-wall-banner.png", @"les-quais-banner.png", @"above-under-inbetween-banner.png", nil];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [eventNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    StagesCellTableViewCell *cell = (StagesCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"StagesCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.eventNaamLabel.text = [eventNames objectAtIndex:indexPath.row];
    cell.eventTijdLabel.text = [eventTijd objectAtIndex:indexPath.row];
    cell.eventGenreLabel.text = [eventGenre objectAtIndex:indexPath.row];
    cell.eventBannerImageView.image = [UIImage imageNamed:[eventBanners objectAtIndex:indexPath.row]];
       cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:[eventBanners objectAtIndex:indexPath.row]] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

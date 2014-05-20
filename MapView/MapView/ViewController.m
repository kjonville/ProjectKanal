//
//  ViewController.m
//  MapView
//
//  Created by Arno Jansens on 20/05/14.
//  Copyright (c) 2014 Arno Jansens. All rights reserved.
//

#import "ViewController.h"
#import "MapPin.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mapview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude = 50.833333;
    region.center.longitude = 4.3;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [mapview setRegion:region animated:YES];
    
    MapPin *ann = [[MapPin alloc] init];
    ann.title = @"Event";
    ann.subtitle = @"Dancing";
    ann.coordinate = region.center;
    [mapview addAnnotation:ann];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)SetMap:(id)sender {
    
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
            
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;
            
        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
    
}

-(IBAction)GetLocation:(id)sender{
    
    mapview.showsUserLocation = YES;
    
}

-(IBAction)Direction:(id)sender{
    
    NSString *urlString = @"http://maps.apple.com/maps?daddr=50.833333,4.3";
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:urlString]];
    
}


@end

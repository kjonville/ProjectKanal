//
//  ViewController.h
//  MapView
//
//  Created by Arno Jansens on 20/05/14.
//  Copyright (c) 2014 Arno Jansens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController {
    
    MKMapView *mapview;
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapview;

-(IBAction)SetMap:(id)sender;

-(IBAction)GetLocation:(id)sender;

-(IBAction)Direction:(id)sender;

@end

//
//  ViewController.h
//  ProjectEcho
//
//  Created by Ricky Leemans on 18/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "EventDetailViewController.h"
#import "Model.h"
#import "modelDays.h"
#import "modelStagedays.h"
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <UITabBarDelegate, ModelProtocol, ModelDaysProtocol, ModelStagedaysProtocol>{
    MKMapView *mapview;
}
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UITabBar *tabbar;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *hourLb;
@property (weak, nonatomic) IBOutlet UIButton *nextEventBtn;
@property (weak, nonatomic) IBOutlet UIButton *prevEventBtn;
@property (weak, nonatomic) IBOutlet UIButton *showHideBtn;
@property (nonatomic, retain) IBOutlet MKMapView *mapview;


- (IBAction)nextEventBtn:(UIButton *)sender;
- (IBAction)prevEventBtn:(UIButton *)sender;
-(UIImage *)drawImage:(UIImage*)profileImage withBadge:(UIImage *)badge;
- (IBAction)hide:(UIButton *)sender;
-(IBAction)Events:(id)sender;
-(IBAction)Food:(id)sender;
-(IBAction)Toilet:(id)sender;
-(IBAction)GetLocation:(id)sender;
-(IBAction)Direction:(id)sender;


@end

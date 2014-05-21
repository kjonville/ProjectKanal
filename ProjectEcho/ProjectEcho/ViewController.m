//
//  ViewController.m
//  ProjectEcho
//
//  Created by Ricky Leemans on 18/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import "ViewController.h"
#import "MapPin.h"

@interface ViewController ()

@property NSArray *titlee;
@property NSArray *hour;
@property NSArray *imgName;
@property NSInteger index;
@property NSString *infoScreen;

@property BOOL navHidden;
@property BOOL infoShow;
@property BOOL indexx;

@property Model *modelForStages;
@property NSArray *StagesDb;

@property modelDays *ModelDays;
@property NSArray *daysDb;

@property modelStagedays *ModelStagedays;
@property NSArray *stagedaysDb;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //self.title = @[@"Dominator", @"Qontinent"];
    self.titlee = @[@"zzz", @"ss"];
    self.hour = @[@"21-24", @"0-5"];
    self.infoScreen = @"battlefield-4-2.jpg";
    self.imgName = @[@"bB1ZB.jpg", @"Bc.jpg"];
    self.index = 0;
    self.navHidden = YES;
    self.infoShow = NO;
    self.indexx = YES;
    
    self.backgroundImage.image = [UIImage imageNamed: self.imgName[self.index]];
    self.hourLb.text = self.hour[self.index];
    //self.titleLb.text = self.titlee[self.index];

    
    [self.showHideBtn setImage:[UIImage imageNamed:@"pijlBoven.png"] forState:UIControlStateNormal];
    
    self.StagesDb = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    self.modelForStages = [[Model alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    self.modelForStages.delegate = self;
    
    // Call the download items method of the home model object
    [self.modelForStages downloadItems];
    
    
    self.daysDb= [[NSArray alloc] init];
    self.ModelDays = [[modelDays alloc] init];
    
    self.ModelDays.delegate = self;
    [self.ModelDays downloadItems2];
    
    
    self.stagedaysDb= [[NSArray alloc] init];
    self.ModelStagedays = [[modelStagedays alloc] init];
    
    self.ModelStagedays.delegate = self;
    [self.ModelStagedays downloadItems3];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
 */


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


- (void)hideTabBar:(UITabBarController *)tabbarcontroller
{
    [UIView animateWithDuration:1 animations:^{
        for (UIView *view in tabbarcontroller.view.subviews) {
            if ([view isKindOfClass:[UITabBar class]]) {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y+49.f, view.frame.size.width, view.frame.size.height)];
            }
            else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height+49.f)];
            }
        }
    } completion:^(BOOL finished) {
        //do smth after animation finishes
        tabbarcontroller.tabBar.hidden = YES;
    }];
}

- (void)showTabBar:(UITabBarController *)tabbarcontroller
{
    tabbarcontroller.tabBar.hidden = NO;
    [UIView animateWithDuration:1 animations:^{
        for (UIView *view in tabbarcontroller.view.subviews) {
            if ([view isKindOfClass:[UITabBar class]]) {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y-49.f, view.frame.size.width, view.frame.size.height)];
            }
            else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height-49.f)];
            }
        }
    } completion:^(BOOL finished) {
        //do smth after animation finishes
    }];
}


- (IBAction)hide:(UIButton *)sender {
    
      if(self.navHidden){
    
        [self hideTabBar:self.tabBarController];
        self.navHidden = NO;
        [self.showHideBtn setImage:[UIImage imageNamed:@"pijlBoven.png"] forState:UIControlStateNormal];

      }
      else{
          [self showTabBar:self.tabBarController];
          self.navHidden = YES;
          [self.showHideBtn setImage:[UIImage imageNamed:@"pijl.png"] forState:UIControlStateNormal];
      }
}

- (IBAction)nextEventBtn:(UIButton *)sender {
    
    if(!self.infoShow){
        if(self.index < [self.titlee count]){
            self.index = self.index + 1;
        }
        
        if(self.index < [self.titlee count]){
            
            CATransition* transition = [CATransition animation];
            [transition setDuration:0.5];
            
            transition.type = kCATransitionPush;
            transition.subtype = kCATransitionFromRight;
            [self.view.layer addAnimation:transition forKey:@"push-transition"];
            
            self.backgroundImage.image = [UIImage imageNamed:self.imgName[self.index]];
            self.hourLb.text = self.hour[self.index];
            //self.titleLb.text = self.titlee[self.index];
            
            
            StagesDb *item = self.StagesDb[self.index];
            self.titleLb.text = item.stageTitle;
        }
    }
    else{
        self.backgroundImage.image = [UIImage imageNamed: self.imgName[self.index]];
        
        self.hourLb.hidden = NO;
        self.titleLb.hidden = NO;
        self.nextEventBtn.hidden = NO;
        self.infoShow = NO;
        self.prevEventBtn.hidden = NO;
        
        CATransition* transition = [CATransition animation];
        [transition setDuration:0.5];
        
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        [self.view.layer addAnimation:transition forKey:@"push-transition"];
        
        self.backgroundImage.image = [UIImage imageNamed:self.imgName[self.index]];
        self.hourLb.text = self.hour[self.index];
        //self.titleLb.text = self.titlee[self.index];
        
        StagesDb *item = self.StagesDb[self.index];
        self.titleLb.text = item.stageTitle;
    }
    
    if(self.index == 0){
        self.indexx = YES;
    }
    else{
        self.indexx = NO;
        NSLog(self.indexx ? @"Yes" : @"No");
    }
}

- (IBAction)prevEventBtn:(UIButton *)sender {
    
    //NSLog(self.indexx ? @"Yes" : @"No");
    if(!self.indexx){
        
        self.index = self.index - 1;
        
            NSLog(@"%lu", (unsigned long)[self.titlee count]);
            NSLog(@"%lu", (unsigned long) self.index);
            
            
            self.backgroundImage.frame = self.view.bounds;
            
            CATransition* transition = [CATransition animation];
            [transition setDuration:0.5];
            transition.type = kCATransitionPush;
            transition.subtype = kCATransitionFromLeft;
            [self.view.layer addAnimation:transition forKey:@"push-transition"];
            self.backgroundImage.image = [UIImage imageNamed:self.imgName[self.index]];
            self.hourLb.text = self.hour[self.index];
            //self.titleLb.text = self.titlee[self.index];
            StagesDb *item = self.StagesDb[self.index];
            self.titleLb.text = item.stageTitle;

    }
    else{
        self.hourLb.hidden = YES;
        self.titleLb.hidden = YES;
        self.infoShow = YES;
        
        self.backgroundImage.frame = self.view.bounds;
        
        CATransition* transition = [CATransition animation];
        [transition setDuration:0.5];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        [self.view.layer addAnimation:transition forKey:@"push-transition"];
        self.backgroundImage.image = [UIImage imageNamed:@"battlefield-4-2.jpg"];
        self.hourLb.text = self.hour[self.index];
       // self.titleLb.text = self.titlee[self.index];
        StagesDb *item = self.StagesDb[self.index];
        self.titleLb.text = item.stageTitle;

        
        self.prevEventBtn.hidden = YES;
    }
    
    if(self.index == 0){
        self.indexx = YES;
    }
    else{
        self.indexx = NO;
        NSLog(self.indexx ? @"Yes" : @"No");
    }
}

-(IBAction)Events:(id)sender {
    
    //verwijder vorige annotations
    
    for (id annotation in mapview.annotations) {
        NSLog(@"%@", annotation);
        NSInteger toRemoveCount = mapview.annotations.count;
        NSMutableArray *toRemove = [NSMutableArray arrayWithCapacity:toRemoveCount];
        [toRemove addObject:annotation];
        [mapview removeAnnotations:toRemove];
    }
    
    //voorbeeld1
    
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude = 50.833333;
    region.center.longitude = 4.3;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [mapview setRegion:region animated:NO];
    
    MapPin *ann = [[MapPin alloc] init];
    ann.title = @"Event";
    ann.subtitle = @"Dancing";
    ann.coordinate = region.center;
    [mapview addAnnotation:ann];
    
    //voorbeeld2
    
    MKCoordinateRegion regione = { {0.0, 0.0}, {0.0, 0.0}};
    regione.center.latitude = 50.833833;
    regione.center.longitude = 4.3;
    regione.span.longitudeDelta = 0.01f;
    regione.span.latitudeDelta = 0.01f;
    [mapview setRegion:regione animated:NO];
    
    MapPin *annn = [[MapPin alloc] init];
    annn.title = @"Event";
    annn.subtitle = @"Dancing";
    annn.coordinate = regione.center;
    [mapview addAnnotation:annn];
    
    //voorbeeld3
    
    MKCoordinateRegion regionee = { {0.0, 0.0}, {0.0, 0.0}};
    regionee.center.latitude = 50.833233;
    regionee.center.longitude = 4.3;
    regionee.span.longitudeDelta = 0.01f;
    regionee.span.latitudeDelta = 0.01f;
    [mapview setRegion:regionee animated:NO];
    
    MapPin *annnn = [[MapPin alloc] init];
    annnn.title = @"Event";
    annnn.subtitle = @"Dancing";
    annnn.coordinate = regione.center;
    [mapview addAnnotation:annnn];
    
    //voorbeeld4
    
    MKCoordinateRegion regio = { {0.0, 0.0}, {0.0, 0.0}};
    regio.center.latitude = 50.833533;
    regio.center.longitude = 4.3;
    regio.span.longitudeDelta = 0.01f;
    regio.span.latitudeDelta = 0.01f;
    [mapview setRegion:regio animated:NO];
    
    MapPin *an = [[MapPin alloc] init];
    an.title = @"Event";
    an.subtitle = @"Dancing";
    an.coordinate = regione.center;
    [mapview addAnnotation:an];
    
}

-(IBAction)Food:(id)sender {
    
    //verwijder vorige annotations
    
    for (id annotation in mapview.annotations) {
        NSLog(@"%@", annotation);
        NSInteger toRemoveCount = mapview.annotations.count;
        NSMutableArray *toRemove = [NSMutableArray arrayWithCapacity:toRemoveCount];
        [toRemove addObject:annotation];
        [mapview removeAnnotations:toRemove];
    }
    
    MKCoordinateRegion toilet = { {0.0, 0.0}, {0.0, 0.0}};
    toilet.center.latitude = 50.833100;
    toilet.center.longitude = 4.3;
    toilet.span.longitudeDelta = 0.01f;
    toilet.span.latitudeDelta = 0.01f;
    [mapview setRegion:toilet animated:NO];
    
    MapPin *ann = [[MapPin alloc] init];
    ann.title = @"Toilet";
    ann.subtitle = @"Women";
    ann.coordinate = toilet.center;
    [mapview addAnnotation:ann];
    
}

-(IBAction)Toilet:(id)sender {
    
    //verwijder vorige annotations
    
    for (id annotation in mapview.annotations) {
        NSLog(@"%@", annotation);
        NSInteger toRemoveCount = mapview.annotations.count;
        NSMutableArray *toRemove = [NSMutableArray arrayWithCapacity:toRemoveCount];
        [toRemove addObject:annotation];
        [mapview removeAnnotations:toRemove];
    }
    
    MKCoordinateRegion toilet = { {0.0, 0.0}, {0.0, 0.0}};
    toilet.center.latitude = 50.833100;
    toilet.center.longitude = 4.3;
    toilet.span.longitudeDelta = 0.01f;
    toilet.span.latitudeDelta = 0.01f;
    [mapview setRegion:toilet animated:NO];
    
    MapPin *ann = [[MapPin alloc] init];
    ann.title = @"Toilet";
    ann.subtitle = @"Women";
    ann.coordinate = toilet.center;
    [mapview addAnnotation:ann];
    
}

-(IBAction)GetLocation:(id)sender{
    
    mapview.showsUserLocation = YES;
    
}

-(IBAction)Direction:(id)sender{
    
    NSString *urlString = @"http://maps.apple.com/maps?daddr=50.833333,4.3";
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:urlString]];
    
}

-(UIImage *)drawImage:(UIImage*)profileImage withBadge:(UIImage *)badge
{
    UIGraphicsBeginImageContextWithOptions(profileImage.size, NO, 0.0f);
    [profileImage drawInRect:CGRectMake(0, 0, profileImage.size.width, profileImage.size.height)];
    [badge drawInRect:CGRectMake(0, profileImage.size.height - badge.size.height, badge.size.width, badge.size.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"homeToEventDetail"]){
        EventDetailViewController *event = segue.destinationViewController;
        event.titlee = self.titleLb.text;
        event.image = self.imgName[self.index];
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"didSelectItem: %ld", (long)item.tag);
}


-(void)itemsDownloadedDays:(NSArray *)items
{
    self.daysDb = items;
}

-(void)itemsDownloadedStagedays:(NSArray *)items
{
    self.stagedaysDb = items;
}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    // Set the downloaded items to the array
    self.StagesDb = items;
    
    StagesDb *stages = self.StagesDb[0];
    //StagesDb *item2 = self.itemsFromDatabase[1];
    self.titleLb.text = stages.stageTitle;
    
    [self.stagedaysDb count];
    
    //StagedaysDb *stagedays = self.stagedaysDb;
    
    //[stagedays count];
    
    //for(int i = 0; i < [stagedays count]; i++){
        
    //}
    
}
@end

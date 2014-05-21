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

@interface ViewController : UIViewController <UITabBarDelegate, ModelProtocol, ModelDaysProtocol, ModelStagedaysProtocol>
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UITabBar *tabbar;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *hourLb;
@property (weak, nonatomic) IBOutlet UIButton *nextEventBtn;
@property (weak, nonatomic) IBOutlet UIButton *prevEventBtn;
@property (weak, nonatomic) IBOutlet UIButton *showHideBtn;

- (IBAction)nextEventBtn:(UIButton *)sender;
- (IBAction)prevEventBtn:(UIButton *)sender;
-(UIImage *)drawImage:(UIImage*)profileImage withBadge:(UIImage *)badge;
- (IBAction)hide:(UIButton *)sender;


@end

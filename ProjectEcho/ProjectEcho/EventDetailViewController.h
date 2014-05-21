//
//  EventDetailViewController.h
//  ProjectEcho
//
//  Created by Ricky Leemans on 18/05/14.
//  Copyright (c) 2014 Ricky Leemans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *TitleLb;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundDetail;
@property NSString *titlee;
@property NSString *image;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBtn;
- (IBAction)backBtn:(UIBarButtonItem *)sender;

@end

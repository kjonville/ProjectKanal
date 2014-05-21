//
//  StagesCellTableViewCell.h
//  Stages
//
//  Created by MEERT Kenneth (s) on 21/05/14.
//  Copyright (c) 2014 Kenneth Meert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StagesCellTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *eventNaamLabel;
@property (nonatomic, weak) IBOutlet UILabel *eventTijdLabel;
@property (nonatomic, weak) IBOutlet UILabel *eventGenreLabel;
@property (nonatomic, weak) IBOutlet UIImageView *eventBannerImageView;

@end

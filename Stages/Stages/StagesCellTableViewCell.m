//
//  StagesCellTableViewCell.m
//  Stages
//
//  Created by MEERT Kenneth (s) on 21/05/14.
//  Copyright (c) 2014 Kenneth Meert. All rights reserved.
//

#import "StagesCellTableViewCell.h"

@implementation StagesCellTableViewCell

@synthesize eventNaamLabel = _eventNaamLabel;
@synthesize eventTijdLabel = _eventTijdLabel;
@synthesize eventGenreLabel = _eventGenreLabel;
@synthesize eventBannerImageView = _eventBannerImageView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

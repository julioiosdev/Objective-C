//
//  CBCellText.m
//  Listados y colecciones
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBCellText.h"

@implementation CBCellText

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

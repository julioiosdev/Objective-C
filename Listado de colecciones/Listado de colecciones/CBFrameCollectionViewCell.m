//
//  CBFrameCollectionViewCell.m
//  Listado de colecciones
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBFrameCollectionViewCell.h"

@implementation CBFrameCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)reloadInputViews{
    
    self.lblInfo.text = self.text;
    NSLog(@"%@", self.text);
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self reloadInputViews];
    // Drawing code
}


@end

//
//  CBRectangulosView.m
//  Figuras
//
//  Created by Carlos on 06/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBRectangulosView.h"

@implementation CBRectangulosView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    
    CGContextAddRect(contexto, CGRectMake(20, 20, rect.size.width-40, rect.size.height-90));
    CGContextAddRect(contexto, CGRectMake(60, 60, rect.size.width-120, rect.size.height-170));
    
    CGContextStrokePath(contexto);
}


@end

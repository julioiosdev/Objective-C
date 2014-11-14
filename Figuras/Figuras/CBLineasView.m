//
//  CBLineasView.m
//  Figuras
//
//  Created by Carlos on 06/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBLineasView.h"

@implementation CBLineasView

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
    
    UIColor * verde = [UIColor greenColor];
    UIColor * azul = [UIColor blueColor];

    CGContextSetLineWidth(contexto, 5);
    CGContextSetStrokeColorWithColor(contexto, verde.CGColor);
    CGContextMoveToPoint(contexto, 20, 20);
    CGContextAddLineToPoint(contexto, rect.size.width-20, 20);
    CGContextStrokePath(contexto);
    CGContextSetStrokeColorWithColor(contexto, azul.CGColor);
    CGContextMoveToPoint(contexto, 20, 20);
    CGContextAddLineToPoint(contexto, 20, rect.size.height-70);
    CGContextStrokePath(contexto);
    
    
    
}


@end

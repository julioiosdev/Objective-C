//
//  CBPizarra.m
//  EventosTouch
//
//  Created by Carlos on 06/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBPizarra.h"


@interface CBPizarra(){
    CGPoint currentPoint;
    CGPoint previousPoint1;

}

@end


@implementation CBPizarra

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor * rojo = [UIColor redColor];
    
    CGContextMoveToPoint(context, previousPoint1.x, previousPoint1.y);
    
    CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextSetLineWidth(context, 3);
    
    CGContextSetStrokeColorWithColor(context, rojo.CGColor);
    
    CGContextStrokePath(context);
    
    
    
 
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    previousPoint1 = [touch previousLocationInView:self];
    currentPoint = [touch locationInView:self];
    [self setNeedsDisplay];

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch  = [touches anyObject];

    previousPoint1  = [touch previousLocationInView:self];

    currentPoint    = [touch locationInView:self];

[self setNeedsDisplay];

    
}

@end

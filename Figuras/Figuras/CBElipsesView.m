//
//  CBElipsesView.m
//  Figuras
//
//  Created by Carlos on 06/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBElipsesView.h"

@implementation CBElipsesView

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
 CGContextRef contexto = UIGraphicsGetCurrentContext();
 
 //CGContextAddEllipseInRect(contexto, CGRectMake(20, 20, rect.size.width-40, rect.size.height-90));
 //CGContextAddEllipseInRect(contexto, CGRectMake(60, 60, rect.size.width-120, rect.size.height-170));
    
    UIColor * rojo = [UIColor redColor];
    UIColor * verde = [UIColor greenColor];
    UIColor * azul = [UIColor blueColor];
    UIColor * amarillo = [UIColor yellowColor];
    UIColor * naranja = [UIColor orangeColor];
    
    int color = 0;
    
    CGContextSetAlpha(contexto, 0.5);
    
    for (int x=20; x<rect.size.width-30; x=x+10) {
        for (int y=20; y<rect.size.height-80; y=y+10) {
            
            switch (color%5) {
                case 0:
                    CGContextSetStrokeColorWithColor(contexto, rojo.CGColor);
                    CGContextSetFillColorWithColor(contexto, verde.CGColor);
                    break;
                case 1:
                    CGContextSetStrokeColorWithColor(contexto, verde.CGColor);
                    CGContextSetFillColorWithColor(contexto, azul.CGColor);
                    break;
                case 2:
                    CGContextSetStrokeColorWithColor(contexto, azul.CGColor);
                    CGContextSetFillColorWithColor(contexto, amarillo.CGColor);
                    break;
                case 3:
                    CGContextSetStrokeColorWithColor(contexto, amarillo.CGColor);
                    CGContextSetFillColorWithColor(contexto, naranja.CGColor);
                    break;
                case 4:
                    CGContextSetStrokeColorWithColor(contexto, naranja.CGColor);
                    CGContextSetFillColorWithColor(contexto, rojo.CGColor);
                    break;
                    
                default:
                    break;
            }
            
            color++;
             CGContextAddEllipseInRect(contexto, CGRectMake(x, y, 20, 20));
            CGContextDrawPath(contexto, kCGPathFillStroke);
        }
    }
    
    
 
}


@end

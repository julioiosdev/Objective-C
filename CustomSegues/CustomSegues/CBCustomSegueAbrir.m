//
//  CBCustomSegueAbrir.m
//  CustomSegues
//
//  Created by Carlos on 04/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBCustomSegueAbrir.h"

@implementation CBCustomSegueAbrir

-(void)perform {
    
    UIViewController * origen = self.sourceViewController;
    UIViewController * destino = self.destinationViewController;
    
    destino.view.transform = CGAffineTransformMakeScale(0, 0);
    
    [origen.view.window addSubview:destino.view];
    [UIView beginAnimations:@"abrir" context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(terminarAnimacion:)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    destino.view.transform = CGAffineTransformMakeScale(1, 1);
    
    [UIView commitAnimations];
    
}

-(void)terminarAnimacion:(NSString *) name{
    
    UIViewController * origen = self.sourceViewController;
    UIViewController * destino = self.destinationViewController;
    
    [origen.view.window setRootViewController:destino];
    
}

@end

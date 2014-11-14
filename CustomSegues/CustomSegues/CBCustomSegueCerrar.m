//
//  CBCustomSegueCerrar.m
//  CustomSegues
//
//  Created by Carlos on 04/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBCustomSegueCerrar.h"

@implementation CBCustomSegueCerrar

-(void)perform {
    
    UIViewController * origen = self.sourceViewController;
    UIViewController * destino = self.destinationViewController;
    
    destino.view.transform = CGAffineTransformMakeScale(1, 1);
    
    [origen.view.window addSubview:destino.view];
    [origen.view.window addSubview:origen.view];
    
    [UIView beginAnimations:@"cerrar" context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(terminarAnimacion:)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    //CGAffineTransformRotate(CGAffineTransformMakeScale(0.8, 0.8), M_PI_2*0.3);
    origen.view.transform = CGAffineTransformMakeScale(0.8, 0.8);  //se hace más pequeño y desaparece hacia arriba
    //origen.view.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0.8, 0.8), M_PI_2*0.3); //rota y desaparece hacia arriba

    
    [UIView commitAnimations];
    
}

-(void)terminarAnimacion:(NSString *) name{
    
    UIViewController * origen = self.sourceViewController;
    
    [UIView beginAnimations:@"cerrar2" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(terminarAnimacion2:)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    //origen.view.transform = CGAffineTransformTranslate(origen.view.transform, 0, -1000);
    origen.view.transform = CGAffineTransformMakeScale(0.8, 0);
    
    [UIView commitAnimations];
    
}

-(void)terminarAnimacion2:(NSString *) name{
    
    UIViewController * origen = self.sourceViewController;
    UIViewController * destino = self.destinationViewController;
    
    [origen.view.window setRootViewController:destino];
    
}

@end

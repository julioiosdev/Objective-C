//
//  CBViewController.m
//  Animando UIKit
//
//  Created by Carlos on 07/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"

@interface CBViewController (){
    
    BOOL animando;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *imagen;
- (IBAction)animar:(id)sender;

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    animando = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animar:(id)sender {
    if (!animando) {
        animando = YES;
        
        [UIView beginAnimations:@"MiAnimación" context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationRepeatCount:3.0];
        [UIView setAnimationRepeatAutoreverses:YES];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animacionTerminada:)];
        
        CGPoint centro = self.imagen.center;
        centro.y += 50;
        self.imagen.center = centro;
        
        self.imagen.alpha = 0.0;
        
        [UIView commitAnimations];
    }

}


- (void)animacionTerminada:(NSString *)nombre{
    
    if ([nombre isEqualToString:@"MiAnimación"]) {
        CGPoint centro = self.imagen.center;
        centro.y -= 50;
        self.imagen.center = centro;
        
        self.imagen.alpha = 1.0;
        animando = NO;
    }
    
}

@end

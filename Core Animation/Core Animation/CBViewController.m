//
//  CBViewController.m
//  Core Animation
//
//  Created by Carlos on 07/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"

@interface CBViewController (){

    BOOL animando;
    
}

@property (weak, nonatomic) IBOutlet UIView *contenedor;
@property (strong, nonatomic) IBOutlet UIImageView *vista1;
@property (strong, nonatomic) IBOutlet UIImageView *vista2;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *proceso;
- (IBAction)animar:(id)sender;

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.contenedor addSubview:self.vista1];
    [self.contenedor addSubview:self.vista2];
    
    animando = NO;
    
    self.vista2.hidden =  YES;
    
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)animationDidStart:(CAAnimation *)anim{
    animando = YES;
    [self.proceso startAnimating];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    animando = NO;
    [self.proceso stopAnimating];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animar:(id)sender {
    
    if (!animando) {
        CATransition * animacion = [CATransition animation];
        animacion.duration = 1.0;
        animacion.delegate = self;
        
        //animacion.type = kCATransitionReveal;
        animacion.type = kCATransitionMoveIn;
        //animacion.type = kCATransitionPush;
        //animacion.type = kCATransitionFade;
        
        //animacion.subtype = kCATransitionFromTop;
        //animacion.subtype = kCATransitionFromBottom;
        //animacion.subtype = kCATransitionFromLeft;
        animacion.subtype = kCATransitionFromRight;
        
        //animacion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        //animacion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        //animacion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        //animacion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        animacion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.contenedor.layer addAnimation:animacion forKey:nil];
        
        self.vista1.hidden = YES;
        self.vista2.hidden = NO;
        
        UIImageView * tmp = self.vista1;
        
        self.vista1 = self.vista2;
        self.vista2 = tmp;
        
    }
}




@end

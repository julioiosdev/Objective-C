//
//  CBViewController.m
//  Transformaciones
//
//  Created by Carlos on 08/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"

@interface CBViewController ()

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)ejecutarAnimacion{
    
    [UIView beginAnimations:@"animacion" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
}

- (void)lanzarAnimacion{
    
    [UIView commitAnimations];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)centrar:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformIdentity;
    [self lanzarAnimacion];
}

- (IBAction)girarIzq:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformRotate(self.view.transform, -M_PI_2*0.1);
    [self lanzarAnimacion];
}

- (IBAction)girarDer:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformRotate(self.view.transform, M_PI_2*0.1);
    [self lanzarAnimacion];
}

- (IBAction)subir:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformTranslate(self.view.transform, 0, -10);
    [self lanzarAnimacion];
}

- (IBAction)bajar:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformTranslate(self.view.transform, 0, 10);
    [self lanzarAnimacion];
}

- (IBAction)derecha:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformTranslate(self.view.transform, 10, 0);
    [self lanzarAnimacion];
}

- (IBAction)izquierda:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformTranslate(self.view.transform, -10, 0);
    [self lanzarAnimacion];
}

- (IBAction)alejar:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformScale(self.view.transform, 0.9, 0.9);
    [self lanzarAnimacion];
}

- (IBAction)acercar:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformScale(self.view.transform, 1.1, 1.1);
    [self lanzarAnimacion];
}

- (IBAction)comprimirH:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformScale(self.view.transform, 1, 0.9);
    [self lanzarAnimacion];
}

- (IBAction)expandirH:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformScale(self.view.transform, 1, 1.1);
    [self lanzarAnimacion];
}

- (IBAction)comprimirV:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformScale(self.view.transform, 0.9, 1);
    [self lanzarAnimacion];
}

- (IBAction)expandirV:(id)sender {
    [self ejecutarAnimacion];
    self.view.transform = CGAffineTransformScale(self.view.transform, 1.1, 1);
    [self lanzarAnimacion];
}


@end

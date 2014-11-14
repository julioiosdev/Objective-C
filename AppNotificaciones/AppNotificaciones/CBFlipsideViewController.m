//
//  CBFlipsideViewController.m
//  AppNotificaciones
//
//  Created by Carlos on 16/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBFlipsideViewController.h"

@interface CBFlipsideViewController ()
- (IBAction)enviarNot1:(id)sender;


@end

@implementation CBFlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)enviarNot1:(id)sender {
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"Mi Notificación1" object:self];
    
}

- (IBAction)enviarNot2:(id)sender {
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"Mi Notificación2" object:self];
    
}
@end

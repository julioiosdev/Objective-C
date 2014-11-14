//
//  CBMainViewController.m
//  AppNotificaciones
//
//  Created by Carlos on 16/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBMainViewController.h"
#import "CBObservador.h"

@interface CBMainViewController ()
@property (strong) CBObservador * observador1;
@property (strong) CBObservador * observador2;

@end

@implementation CBMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.observador1 = [[CBObservador alloc] initWithNombre:@"observador1" notificacion:@"Mi Notificación1"];
    self.observador2 = [[CBObservador alloc] initWithNombre:@"observador2" notificacion:@"Mi Notificación2"];
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self
               selector:@selector(recibirNotificacion:)
                   name:@"UIApplicationDidBecomeActiveNotification"
                 object:nil];
    
    [center addObserver:self
               selector:@selector(recibirNotificacion:)
                   name:@"UIApplicationDidEnterBackgroundNotification"
                 object:nil];
    
    [center addObserver:self
               selector:@selector(recibirNotificacion:)
                   name:@"UIApplicationDidReceiveMemoryWarningNotification"
                 object:nil];
    
    [center addObserver:self
               selector:@selector(recibirNotificacion:)
                   name:@"UIApplicationDidWillTerminateNotification"
                 object:nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}


- (void) recibirNotificacion:(NSNotification *) notificacion {
    
    NSLog(@"He recibido la notificación: %@", notificacion.name);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(CBFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end

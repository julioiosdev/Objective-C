//
//  CBPredicadosViewController.h
//  Modelo1
//
//  Created by Carlos on 30/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBAppDelegate.h"
#import "modelo.h"

@interface CBPredicadosViewController : UIViewController

@property (weak, readonly) NSManagedObjectContext * contexto;
- (IBAction)mostrarTodos:(id)sender;
- (IBAction)mostrarMujeres:(id)sender;
- (IBAction)mostrarHombres:(id)sender;
- (IBAction)mostrarMujeresMenoresDe30:(id)sender;
- (IBAction)mostrarHombresEntre30y50:(id)sender;
- (IBAction)mostrarMenoresDe25SolterosConB:(id)sender;

- (void) mostrar:(NSArray *) usuarios;


@end

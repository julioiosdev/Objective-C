//
//  CBViewController.h
//  Transformaciones
//
//  Created by Carlos on 08/04/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBViewController : UIViewController


- (IBAction)centrar:(id)sender;

- (IBAction)girarIzq:(id)sender;
- (IBAction)girarDer:(id)sender;

- (IBAction)subir:(id)sender;
- (IBAction)bajar:(id)sender;
- (IBAction)derecha:(id)sender;
- (IBAction)izquierda:(id)sender;

- (IBAction)alejar:(id)sender;
- (IBAction)acercar:(id)sender;

- (IBAction)comprimirH:(id)sender;
- (IBAction)expandirH:(id)sender;
- (IBAction)comprimirV:(id)sender;
- (IBAction)expandirV:(id)sender;

@end

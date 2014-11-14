//
//  CBKVOViewController.h
//  Modelo1
//
//  Created by Carlos on 31/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBAppDelegate.h"
#import "modelo.h"


@interface CBKVOViewController : UIViewController

@property (weak, readonly) NSManagedObjectContext * contexto;


@property (weak, nonatomic) IBOutlet UILabel *txtNombre;
@property (weak, nonatomic) IBOutlet UILabel *txtSexo;
@property (weak, nonatomic) IBOutlet UILabel *txtEstadoCivil;
@property (weak, nonatomic) IBOutlet UILabel *txtEdad;
@property (weak, nonatomic) IBOutlet UISwitch *swchA;
@property (weak, nonatomic) IBOutlet UISwitch *swchB;
@property (weak, nonatomic) IBOutlet UIImageView *imgFoto;

- (IBAction)cambiar:(id)sender;

@end

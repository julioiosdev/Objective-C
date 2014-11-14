//
//  CBAddViewController.m
//  TablaMVC
//
//  Created by Carlos on 12/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBAddViewController.h"

@interface CBAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtNombre;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtTel;

- (IBAction)salvar:(id)sender;
- (IBAction)cancelar:(id)sender;

@end

@implementation CBAddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)salvar:(id)sender {
    CBContacto * c = [[CBContacto alloc] initWithNombre:self.txtNombre.text
                                                  email:self.txtEmail.text
                                               telefono:self.txtTel.text];
    
    [self.delegado salvar:c];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
    
}

@end

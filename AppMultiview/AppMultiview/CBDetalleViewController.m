//
//  CBDetalleViewController.m
//  AppMultiview
//
//  Created by Carlos on 31/01/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBDetalleViewController.h"

@interface CBDetalleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTexto;
- (IBAction)cerrar:(id)sender;

@end

@implementation CBDetalleViewController

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
    self.lblTexto.text = self.texto;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cerrar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

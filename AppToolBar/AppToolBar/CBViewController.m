//
//  CBViewController.m
//  AppToolBar
//
//  Created by Carlos on 30/01/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"

@interface CBViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTexto;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btn1;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btn2;
- (IBAction)borrar:(id)sender;
- (IBAction)actualizar:(id)sender;

@property (strong, nonatomic) NSMutableArray * modelo;

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.modelo = [NSMutableArray new];
    [self.modelo addObject:@"Posición1"];
    [self.modelo addObject:@"Posición2"];
    [self borrar:self];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)borrar:(id)sender {
    self.lblTexto.text = @"";
}

- (IBAction)actualizar:(id)sender {
    if (sender == self.btn1) {
        self.lblTexto.text = [self.modelo objectAtIndex:0];
    }
    if (sender == self.btn2) {
        self.lblTexto.text = [self.modelo objectAtIndex:1];
    }
}
@end

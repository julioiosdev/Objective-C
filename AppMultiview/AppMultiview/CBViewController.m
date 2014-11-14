//
//  CBViewController.m
//  AppMultiview
//
//  Created by Carlos on 31/01/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"
#import "CBDetalleViewController.h"

@interface CBViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@property (strong, nonatomic) NSMutableArray * modelo;
@end

@implementation CBViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.modelo = [NSMutableArray new];
    [self.modelo addObject:@"Pulsado botón 1"];
    [self.modelo addObject:@"Pulsado botón 2"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CBDetalleViewController * c = segue.destinationViewController;
    
    if (sender==self.btn1) {
        c.texto = [self.modelo objectAtIndex:0];
    }
    else {
        c.texto = [self.modelo objectAtIndex:1];
    }
}

@end

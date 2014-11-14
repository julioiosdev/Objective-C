//
//  CBViewController.m
//  AppKVO
//
//  Created by Carlos on 22/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"

@interface CBViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblTexto;
@property (weak, nonatomic) IBOutlet UITextField *txtTexto;
@property (strong, nonatomic) NSString * texto;

- (IBAction)actualizarTexto:(id)sender;

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addObserver:self forKeyPath:@"texto" options:NSKeyValueObservingOptionNew context:nil];
    
    self.txtTexto.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{

    self.lblTexto.text = [change valueForKey:@"new"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actualizarTexto:(id)sender {
    
    self.texto = self.txtTexto.text;
    
}
@end

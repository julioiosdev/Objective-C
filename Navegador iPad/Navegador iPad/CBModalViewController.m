//
//  CBModalViewController.m
//  Navegador iPad
//
//  Created by Carlos on 07/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBModalViewController.h"

@interface CBModalViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtContenido;

@end

@implementation CBModalViewController
- (IBAction)cerrarModal:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];


}

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
    
    self.txtContenido.text = self.codigo;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

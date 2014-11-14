//
//  CBFirstViewController.m
//  iPad Tab
//
//  Created by Carlos on 06/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBFirstViewController.h"

@interface CBFirstViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *sclContenido;

@end

@implementation CBFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sclContenido.scrollEnabled = YES;
    self.sclContenido.contentSize = CGSizeMake(768, 1400);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

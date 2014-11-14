//
//  CBViewController.m
//  Navegador iPad
//
//  Created by Carlos on 07/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"
#import "CBMarcador.h"
#import "CBTPopover.h"
#import "CBModalViewController.h"

@interface CBViewController () <UITextFieldDelegate, UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aivLoading;
@property (weak, nonatomic) IBOutlet UIWebView *wbvNavegador;
@property (weak, nonatomic) IBOutlet UITextField *txtUrl;

@property (strong, nonatomic) NSMutableArray * historial;

-(void)loadURL;

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.txtUrl.delegate = self;
    self.wbvNavegador.delegate = self;
    
    self.txtUrl.text = @"http://carlosiosdev.com";
    [self loadURL];
    
    self.historial = [NSMutableArray new];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadURL{
    
    [self.wbvNavegador loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.txtUrl.text]]];
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [self.aivLoading startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString * titulo = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSString * URL = [webView.request.URL absoluteString];
    
    [self.navigationController.navigationBar.items setValue:titulo forKey:@"prompt"];
    
    self.txtUrl.text = URL;
    
    CBMarcador * m =[[CBMarcador alloc] initWithTitulo:titulo URL:URL];
    
    [self.historial insertObject:m atIndex:0];
    
    [self.aivLoading stopAnimating];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self loadURL];
    [textField resignFirstResponder];
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
    if ([segue.identifier isEqualToString:@"popover"]) {
        CBTPopover * tabla = [segue destinationViewController];
        tabla.delegate = self;
        tabla.historial = self.historial;
        tabla.popover = [(UIStoryboardPopoverSegue *) segue popoverController];
    }
    
    if ([segue.identifier isEqualToString:@"modal"]) {
        CBModalViewController * modal = [segue destinationViewController];
        modal.codigo = [self.wbvNavegador stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    }
    
}

-(void)urlSeleccionada:(NSString *)url PopoverController:(UIPopoverController *)popover{
    
    self.txtUrl.text = url;
    [self loadURL];
    [popover dismissPopoverAnimated:YES];
}


































@end

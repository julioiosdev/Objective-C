//
//  CBViewController.m
//  ControlEdificios
//
//  Created by Carlos on 23/06/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface CBViewController () <ABNewPersonViewControllerDelegate, ABPeoplePickerNavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgFoto;
@property (weak, nonatomic) IBOutlet UILabel *lblNombre;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UILabel *lblTel;
- (IBAction)crearContacto:(id)sender;
- (IBAction)mostrarVista:(id)sender;

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)crearContacto:(id)sender {
    
    ABNewPersonViewController * c = [ABNewPersonViewController new];
    c.newPersonViewDelegate = self;
    
    UINavigationController * n = [[UINavigationController alloc] initWithRootViewController:c];
    
    [self presentViewController:n animated:YES completion:nil];
    
    
}


-(void)newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(ABRecordRef)person{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)mostrarVista:(id)sender {
    ABPeoplePickerNavigationController * p = [ABPeoplePickerNavigationController new];
    p.peoplePickerDelegate = self;
    [self presentViewController:p animated:YES completion:nil];
    
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {

    NSString * nombre = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
    NSString * apellidos = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
    
    self.lblNombre.text = [NSString stringWithFormat:@"%@ %@", nombre, apellidos];
    
    ABMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
    
    if (ABMultiValueGetCount(emails)>0) {
        self.lblEmail.text = (__bridge NSString *)(ABMultiValueCopyValueAtIndex(emails, 0));
    }
    
    ABMultiValueRef tels = ABRecordCopyValue(person, kABPersonPhoneProperty);
    
    if (ABMultiValueGetCount(tels)>0) {
        self.lblTel.text = (__bridge NSString *)(ABMultiValueCopyValueAtIndex(tels, 0));
    }
    
    self.imgFoto.image = [UIImage imageWithData:(__bridge NSData *)(ABPersonCopyImageData(person))];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
    return NO;
}



















@end

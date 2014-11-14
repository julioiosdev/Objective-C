//
//  CBAddViewController.h
//  TablaMVC
//
//  Created by Carlos on 12/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBContacto.h"

@protocol CBAddViewControllerDelegate

- (void) salvar: (CBContacto *) contacto;

@end

@interface CBAddViewController : UIViewController <UITextFieldDelegate>


@property (strong) id <CBAddViewControllerDelegate> delegado;

@end

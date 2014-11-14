//
//  CBFlipsideViewController.h
//  AppNotificaciones
//
//  Created by Carlos on 16/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBFlipsideViewController;

@protocol CBFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(CBFlipsideViewController *)controller;
@end

@interface CBFlipsideViewController : UIViewController

@property (weak, nonatomic) id <CBFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end

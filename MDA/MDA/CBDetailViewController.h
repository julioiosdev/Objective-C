//
//  CBDetailViewController.h
//  MDA
//
//  Created by Carlos on 13/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

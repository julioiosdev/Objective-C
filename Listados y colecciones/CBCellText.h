//
//  CBCellText.h
//  Listados y colecciones
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBCellText : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgUser;
@property (weak, nonatomic) IBOutlet UILabel * lblUser;
@property (weak, nonatomic) IBOutlet UITextView * lblComment;

@end

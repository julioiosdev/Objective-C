//
//  CBFrameCollectionViewCell.h
//  Listado de colecciones
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBFrameCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) NSString * text;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;

@end

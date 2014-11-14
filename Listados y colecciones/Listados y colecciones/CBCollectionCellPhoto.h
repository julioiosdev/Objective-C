//
//  CBCollectionCellPhoto.h
//  Listados y colecciones
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBCollectionCellPhoto : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgPhoto;

@property NSString * imgFile;

@end

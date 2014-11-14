//
//  CBCellWithColecction.h
//  Listado de colecciones
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBCellWithColecction : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView * clcColecction;

@property (strong, nonatomic) NSMutableArray * coleccion;

@end

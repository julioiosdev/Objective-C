//
//  Documento.h
//  Modelo1
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tema;

@interface Documento : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) Tema *estaEn;

@end

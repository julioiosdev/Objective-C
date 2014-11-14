//
//  Actividad.h
//  AppcoreData
//
//  Created by Carlos on 16/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tema;

@interface Actividad : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) Tema *actTema;

@end

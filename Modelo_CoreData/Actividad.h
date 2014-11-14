//
//  Actividad.h
//  Modelo1
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Actividad : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSManagedObject *estaEn;

@end

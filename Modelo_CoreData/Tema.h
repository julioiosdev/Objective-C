//
//  Tema.h
//  Modelo1
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Actividad, Curso;

@interface Tema : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet *estaEn;
@property (nonatomic, retain) Actividad *tieneActividad;
@property (nonatomic, retain) NSManagedObject *tieneDocumento;
@end

@interface Tema (CoreDataGeneratedAccessors)

- (void)addEstaEnObject:(Curso *)value;
- (void)removeEstaEnObject:(Curso *)value;
- (void)addEstaEn:(NSSet *)values;
- (void)removeEstaEn:(NSSet *)values;

@end

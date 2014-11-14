//
//  Tema.h
//  AppcoreData
//
//  Created by Carlos on 16/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Actividad, Curso, Documento, Video;

@interface Tema : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSNumber * numero;
@property (nonatomic, retain) Curso *perteneceA;
@property (nonatomic, retain) NSSet *temaDoc;
@property (nonatomic, retain) NSSet *temaVideo;
@property (nonatomic, retain) NSSet *temaAct;
@end

@interface Tema (CoreDataGeneratedAccessors)

- (void)addTemaDocObject:(Documento *)value;
- (void)removeTemaDocObject:(Documento *)value;
- (void)addTemaDoc:(NSSet *)values;
- (void)removeTemaDoc:(NSSet *)values;

- (void)addTemaVideoObject:(Video *)value;
- (void)removeTemaVideoObject:(Video *)value;
- (void)addTemaVideo:(NSSet *)values;
- (void)removeTemaVideo:(NSSet *)values;

- (void)addTemaActObject:(Actividad *)value;
- (void)removeTemaActObject:(Actividad *)value;
- (void)addTemaAct:(NSSet *)values;
- (void)removeTemaAct:(NSSet *)values;

@end

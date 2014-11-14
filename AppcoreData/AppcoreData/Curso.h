//
//  Curso.h
//  AppcoreData
//
//  Created by Carlos on 16/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tema;

@interface Curso : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSNumber * activado;
@property (nonatomic, retain) NSSet *tiene;
@end

@interface Curso (CoreDataGeneratedAccessors)

- (void)addTieneObject:(Tema *)value;
- (void)removeTieneObject:(Tema *)value;
- (void)addTiene:(NSSet *)values;
- (void)removeTiene:(NSSet *)values;

@end

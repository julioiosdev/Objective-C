//
//  Curso.h
//  Modelo1
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Curso : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet *tiene;
@end

@interface Curso (CoreDataGeneratedAccessors)

- (void)addTieneObject:(NSManagedObject *)value;
- (void)removeTieneObject:(NSManagedObject *)value;
- (void)addTiene:(NSSet *)values;
- (void)removeTiene:(NSSet *)values;

@end

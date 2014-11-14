//
//  CBAppDelegate.m
//  AppcoreData
//
//  Created by Carlos on 16/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBAppDelegate.h"
#import "modelo.h"

@implementation CBAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


- (void) crearDatos{
    NSEntityDescription * CursoiOS = [NSEntityDescription insertNewObjectForEntityForName:@"Curso"  inManagedObjectContext:self.managedObjectContext];
    
    [CursoiOS setValue:@"Curso iOS" forKeyPath:@"nombre"];
    [CursoiOS setValue:[NSNumber numberWithBool:NO] forKey:@"activado"];
    Curso * CursoPOO = [NSEntityDescription insertNewObjectForEntityForName:@"Curso"  inManagedObjectContext:self.managedObjectContext];
    
    CursoPOO.nombre = @"Curso POO";
    CursoPOO.activado = [NSNumber numberWithBool:NO];
    Tema * temaPOO1 = [NSEntityDescription insertNewObjectForEntityForName:@"Tema"  inManagedObjectContext:self.managedObjectContext];
    
    temaPOO1.nombre = @"Tema POO 1";
    temaPOO1.numero = [NSNumber numberWithInt:1];
    [CursoPOO addTieneObject:temaPOO1];
    
    Tema * temaPOO2 = [NSEntityDescription insertNewObjectForEntityForName:@"Tema"  inManagedObjectContext:self.managedObjectContext];
    
    temaPOO2.nombre = @"Tema POO 2";
    temaPOO2.numero = [NSNumber numberWithInt:2];
    [CursoPOO addTieneObject:temaPOO2];
    
    Tema * temaPOO3 = [NSEntityDescription insertNewObjectForEntityForName:@"Tema"  inManagedObjectContext:self.managedObjectContext];
    
    temaPOO3.nombre = @"Tema POO 3";
    temaPOO3.numero = [NSNumber numberWithInt:3];
    [CursoPOO addTieneObject:temaPOO3];
    
    Tema * temaPOO4 = [NSEntityDescription insertNewObjectForEntityForName:@"Tema"  inManagedObjectContext:self.managedObjectContext];
    
    temaPOO4.nombre = @"Tema POO 4";
    temaPOO4.numero = [NSNumber numberWithInt:4];
    [CursoPOO addTieneObject:temaPOO4];
    
}

- (void) mostrarDatos{
    
    NSFetchRequest * busquedaCursos = [[NSFetchRequest alloc] initWithEntityName:@"Curso"];
    
    //ordenacion
    
    NSArray * temas;
    NSArray * descriptorDeOrdenacion = [NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"numero" ascending:YES], nil];
    
    //recorrido
    
    NSArray * cursos = [self.managedObjectContext executeFetchRequest:busquedaCursos error:nil];
    
    for (Curso * c in cursos) {
        NSLog(@"==== %@ ====", c.nombre);
        
        if ([c.activado boolValue]) {
            NSLog(@"Activado");
        }else{
            NSLog(@"Desactivado");
        }
        
        temas = [c.tiene sortedArrayUsingDescriptors:descriptorDeOrdenacion];
        for (Tema * t in temas) {
            NSLog(@"    Tema%d - %@", [t.numero intValue], t.nombre);
        }
    }
    
    
}



- (void) activarCursos{
    NSFetchRequest * busquedaCursos = [[NSFetchRequest alloc] initWithEntityName:@"Curso"];
    NSArray * cursos = [self.managedObjectContext executeFetchRequest:busquedaCursos error:nil];
    
    for (Curso * c in cursos) {
        c.activado = [NSNumber numberWithBool:YES];
    }
}


- (void) borrarCursos {
    
        NSFetchRequest * busquedaCursos = [[NSFetchRequest alloc] initWithEntityName:@"Curso"];
        NSArray * cursos = [self.managedObjectContext executeFetchRequest:busquedaCursos error:nil];
    
    for (Curso * c in cursos) {
        [self.managedObjectContext deleteObject:c];
    }
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self crearDatos];
    [self activarCursos];
    [self saveContext];
    [self borrarCursos];
    [self mostrarDatos];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"AppcoreData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"AppcoreData.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end

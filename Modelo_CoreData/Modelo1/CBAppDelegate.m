//
//  CBAppDelegate.m
//  Modelo1
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBAppDelegate.h"
#import "modelo.h"

@implementation CBAppDelegate

@synthesize managedObjectContext1 = _managedObjectContext1;
@synthesize managedObjectModel1 = _managedObjectModel1;
@synthesize persistentStoreCoordinator1 = _persistentStoreCoordinator1;

@synthesize managedObjectContext2 = _managedObjectContext2;
@synthesize managedObjectModel2 = _managedObjectModel2;
@synthesize persistentStoreCoordinator2 = _persistentStoreCoordinator2;

- (BOOL) firstExec{
    
    //Creamos la ruta del fichero de configuración
    NSString *plist = [[[self applicationDocumentsDirectory] path] stringByAppendingPathComponent:@"config.plist"];
    
    NSFileManager *fileManager = [NSFileManager new];
    
    //preguntamos si el fichero existe o no
    
    if (![fileManager fileExistsAtPath: plist]) {
        
        //Creamos un diccionario para guardar las opciones de configuración
        NSMutableDictionary *config = [NSMutableDictionary new];
        
        //Asignamos la configuración inicial
        [config setValue:[NSNumber numberWithBool:NO] forKey:@"primeraEjecución"];
        [config setValue:[NSNumber numberWithBool:NO] forKey:@"config1"];
        [config setValue:[NSNumber numberWithBool:NO] forKey:@"config2"];
        [config setValue:[NSNumber numberWithBool:NO] forKey:@"config3"];
        
        //Guardamos el diccionario en el archivo config.plist
        NSLog(@"Configuración: %@", config);
        [config writeToFile:plist atomically: YES];
        
        //Llamamos a los métodos de iniciación
        [self llenarModelo];
        
        //Es la primera ejecución del programa
        return YES;
        
    }
    
    //Imprimimos la configuración
    NSMutableDictionary *config = [NSMutableDictionary dictionaryWithContentsOfFile:plist];
    NSLog(@"Configuración: %@", config);
    
    //No es la primera ejecución del programa
    return NO;
    
    
}

- (void) llenarModelo{
    
    int         x;
    Usuario     * usuario;
    
    NSLog(@"Llenamos el modelo.");
    
    NSArray * estadoCivil = [NSArray arrayWithObjects: @"Soltero/a", @"Casado/a", @"Divorciado/a", nil];
    
    NSArray * mujeres = [NSArray arrayWithObjects:@"María", @"Sofía", @"Verónica", @"Rebeca", @"Laura", @"Milagros", @"Lucía", @"Samanta", nil];
    
    NSArray * albumMujeres = [NSArray arrayWithObjects:@"m1.jpeg", @"m2.jpeg",@"m3.jpeg",@"m4.jpeg",@"m5.jpeg",@"m6.jpeg",@"m7.jpeg",@"m8.jpeg", nil];
    
    NSArray * hombres = [NSArray arrayWithObjects:@"Pedro", @"Luis", @"El Hombre de Negro", @"Mateo", @"Adrian", @"Zeus", @"Javier", @"Ricardo", nil];
    
    NSArray * albumHombres = [NSArray arrayWithObjects:@"h1.jpeg", @"h2.jpeg",@"h3.jpeg",@"h4.jpeg",@"h5.jpeg",@"h6.jpeg",@"h7.jpeg",@"h8.jpeg", nil];
    
    //añadimos las mujeres
    
    for (x=0; x<mujeres.count; x++) {
        usuario = [NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:self.managedObjectContext1];
        usuario.nombre = [mujeres objectAtIndex:x];
        usuario.sexo = @"Mujer";
        usuario.edad = 18 + arc4random_uniform(30);
        usuario.a = arc4random_uniform(2);
        usuario.b = arc4random_uniform(2);
        usuario.estadoCivil = [estadoCivil objectAtIndex:arc4random_uniform(3)];
        usuario.foto = [albumMujeres objectAtIndex:x];
    }
    
    for (x=0; x<hombres.count; x++) {
        usuario = [NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:self.managedObjectContext1];
        usuario.nombre = [hombres objectAtIndex:x];
        usuario.sexo = @"Hombre";
        usuario.edad = 18 + arc4random_uniform(30);
        usuario.a = arc4random_uniform(2);
        usuario.b = arc4random_uniform(2);
        usuario.estadoCivil = [estadoCivil objectAtIndex:arc4random_uniform(3)];
        usuario.foto = [albumHombres objectAtIndex:x];
    }
    
    [self saveContext1];
    
    
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSLog(@"Primera Ejecución: %d", [self firstExec]);
    //[self llenarModelo];
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
    [self saveContext1];
    [self saveContext2];
}

- (void)saveContext1
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext1;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}


- (void)saveContext2
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext2;
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
- (NSManagedObjectContext *)managedObjectContext1
{
    if (_managedObjectContext1 != nil) {
        return _managedObjectContext1;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator1];
    if (coordinator != nil) {
        _managedObjectContext1 = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext1 setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext1;
}


- (NSManagedObjectContext *)managedObjectContext2
{
    if (_managedObjectContext2 != nil) {
        return _managedObjectContext2;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator2];
    if (coordinator != nil) {
        _managedObjectContext2 = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext2 setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext2;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel1
{
    if (_managedObjectModel1 != nil) {
        return _managedObjectModel1;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Modelo1" withExtension:@"momd"];
    _managedObjectModel1 = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel1;
}


- (NSManagedObjectModel *)managedObjectModel2
{
    if (_managedObjectModel2 != nil) {
        return _managedObjectModel2;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Modelo2" withExtension:@"momd"];
    _managedObjectModel2 = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel2;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator1
{
    if (_persistentStoreCoordinator1 != nil) {
        return _persistentStoreCoordinator1;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Modelo1.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator1 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel1]];
    if (![_persistentStoreCoordinator1 addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
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
    
    return _persistentStoreCoordinator1;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator2
{
    if (_persistentStoreCoordinator2 != nil) {
        return _persistentStoreCoordinator2;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Modelo2.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator2 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel2]];
    if (![_persistentStoreCoordinator2 addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
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
    
    return _persistentStoreCoordinator2;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end

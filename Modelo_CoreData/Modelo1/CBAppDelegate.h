//
//  CBAppDelegate.h
//  Modelo1
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext1;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel1;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator1;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext2;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel2;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator2;

- (void)saveContext1;
- (void)saveContext2;

- (NSURL *)applicationDocumentsDirectory;

@end

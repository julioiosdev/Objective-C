//
//  CBListadoViewController.h
//  Modelo1
//
//  Created by Carlos on 31/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBAppDelegate.h"
#import "modelo.h"

@interface CBListadoViewController : UITableViewController <NSFetchedResultsControllerDelegate, UISearchBarDelegate>

@property (weak, readonly) NSManagedObjectContext * contexto;
@property (strong, nonatomic) NSFetchedResultsController * frController;
@property (strong, nonatomic) NSMutableArray * resultados;


@end

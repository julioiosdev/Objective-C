//
//  CBListadoViewController.m
//  Modelo1
//
//  Created by Carlos on 31/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBListadoViewController.h"

@interface CBListadoViewController ()

@end

@implementation CBListadoViewController

- (NSManagedObjectContext *) contexto{
    CBAppDelegate * app = [[UIApplication sharedApplication] delegate];
    return app.managedObjectContext1;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView setContentOffset:CGPointMake(0, 45)];
    self.resultados = [NSMutableArray new];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//Número de secciones
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (tableView == self.tableView) {
         return [[self.frController sections] count];
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.tableView) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [self.frController sections][section];
        return [sectionInfo numberOfObjects];
    }
    return self.resultados.count;
}

- (void) configurarCelda:(UITableViewCell *) cell atIndexPath:(NSIndexPath *) indexPath
{
    Usuario *u = [self.frController objectAtIndexPath:indexPath];
    cell.textLabel.text = u.nombre;
    cell.imageView.image = [UIImage imageNamed:u.foto];
}

- (void) configurarCeldaDeBusqueda:(UITableViewCell *) cell atIndexPath:(NSIndexPath *) indexPath
{
    Usuario *u = [self.resultados objectAtIndex:indexPath.row];
    cell.textLabel.text = u.nombre;
    cell.imageView.image = [UIImage imageNamed:u.foto];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Celda";
    UITableViewCell *cell;
    
    if (tableView == self.tableView) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        [self configurarCelda:cell atIndexPath:indexPath];
    }else{
        cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil){
            cell = [UITableViewCell new];
        }
        [self configurarCeldaDeBusqueda:cell atIndexPath:indexPath];
    }
    return cell;
}


#pragma mark - Métodos relacionados con NSFetchedResultsController

- (NSFetchedResultsController *) frController{
    
    if (_frController == nil){
        
        NSFetchRequest * request = [NSFetchRequest new];
        
        NSEntityDescription * entidad = [NSEntityDescription entityForName:@"Usuario" inManagedObjectContext:self.contexto];
        
        request.entity = entidad;
        
        //recuperar los 10 elementos próximos
        request.fetchBatchSize = 10;
        
        //ordenamos por nombre y por sexo
        NSSortDescriptor * ordenPorNombre = [[NSSortDescriptor alloc] initWithKey:@"nombre" ascending:NO];
        
        NSSortDescriptor * ordenPorSexo = [[NSSortDescriptor alloc] initWithKey:@"sexo" ascending:NO];
        
        NSArray * listadoDeOrdenadores = [[NSArray alloc] initWithObjects:ordenPorNombre,ordenPorSexo, nil];
        
        //asignamos el orden de los elementos al FetchRequest
        [request setSortDescriptors:listadoDeOrdenadores];
        
        //creamos el FetchRequestController haciendo uso del contexto y del request
        _frController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.contexto sectionNameKeyPath:nil cacheName:@"Listado"];
        
        //asignamos el delegado
        _frController.delegate = self;
        
        NSError *error = nil;
        
        if (![self.frController performFetch:&error]){
            NSLog(@"Upps!! parece que hay un error %@, %@", error, [error userInfo]);
            abort();
        }
        
    }
    return _frController;
}

//Es llamado cuando se realizarán cambios en el FetchResultController
- (void) controllerWillChangeContent:(NSFetchedResultsController *)controller{
    
    [self.tableView beginUpdates];
    
}

//Es llamado cuando se realiza algún cambio en alguna sección:
//  -Se ha insertado una nueva sección
//  -Se ha eliminado una sección
- (void) controller: (NSFetchedResultsController *) controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type{
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            break;
    }
}

//Es llamado cuando se realiza algún cambio en algún objeto:
// -Se ha insertado un nuevo objeto
// -Se ha eliminado un objeto
// -Se ha actualizado un objeto
// -Se ha movido de posición un objeto
- (void) controller: (NSFetchedResultsController *) controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    
    UITableView * tableView = self.tableView;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        
        case NSFetchedResultsChangeUpdate:
            [self configurarCelda:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            break;
    }
    
}

//Es llamado cuando se han terminado de realizar los cambios en el FetchResultController
- (void) controllerDidChangeContent:(NSFetchedResultsController *) controller{
    
    [self.tableView endUpdates];
}



#pragma mark - Métodos delegados de UISearchBarController

- (BOOL) searchDisplayController:(UISearchDisplayController *) controller shouldReloadTableForSearchString:(NSString *)searchString{
    
    [self.resultados removeAllObjects];
    
    NSFetchRequest * fetchRequest = [NSFetchRequest alloc];
    
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"nombre contains[cd] %@ or estadoCivil contains[cd] %@ or sexo contains[cd] %@", searchString, searchString, searchString];
    
    fetchRequest.entity = [NSEntityDescription entityForName:@"Usuario" inManagedObjectContext:self.contexto];
    
    NSError * error = nil;
    NSArray * results = [self.contexto executeFetchRequest:fetchRequest error:&error];
    
    if (error){
        NSLog(@"Upps!! parece que hay un error %@, %@", error, [error userInfo]);
        abort();
    }
    
    [self.resultados addObjectsFromArray:results];
    
    return YES;
    
}


- (void) searchDisplayControllerDidEndSearch:(UISearchDisplayController *) controller{
    
    [self.tableView setContentOffset:CGPointMake(0, 45)];
    
}





/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

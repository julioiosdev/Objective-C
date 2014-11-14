//
//  CBEventosTableViewController.m
//  Bibliotecas
//
//  Created by Carlos on 06/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBEventosTableViewController.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface CBEventosTableViewController () <EKEventEditViewDelegate, EKEventViewDelegate>
- (IBAction)crearEvento:(id)sender;

@property (strong) EKEventStore * almacenDeEventos;
@property (strong) NSMutableArray * listaEventos;
@property (strong) EKCalendar * calendario;
@property BOOL permitido;

-(NSArray *) proximosEventos;


@end

@implementation CBEventosTableViewController

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
    self.almacenDeEventos = [EKEventStore new];
    
    [self.almacenDeEventos requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        if (granted) {
            self.listaEventos = [NSMutableArray new];
            self.calendario = [self.almacenDeEventos defaultCalendarForNewEvents];
            [self.listaEventos addObjectsFromArray:[self proximosEventos]];
            self.permitido = YES;
        }else{
            self.permitido = NO;
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Acceso no permitido" message:@"Para que la aplicación pueda acceder a los eventos, debe activar el uso de eventos en las opciones de privacidad" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
    
    self.listaEventos = [NSMutableArray new];
    self.calendario = [self.almacenDeEventos defaultCalendarForNewEvents];
    [self.listaEventos addObjectsFromArray:[self proximosEventos]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(NSArray *)proximosEventos{
    
    NSDate * ahora = [NSDate date];
    
    NSDate * enUnaHora = [NSDate dateWithTimeIntervalSinceNow:3600];
    
    NSArray * calendarios = [[NSArray alloc] initWithObjects:self.calendario, nil];
    
    NSPredicate * predicado = [self.almacenDeEventos predicateForEventsWithStartDate:ahora
                                                                             endDate:enUnaHora
                                                                           calendars:calendarios];
    
    return [self.almacenDeEventos eventsMatchingPredicate:predicado];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (self.permitido) {
        return self.listaEventos.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.listaEventos objectAtIndex:indexPath.row] title];
    
    return cell;
}


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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EKEventViewController * e = [EKEventViewController new];
    e.delegate = self;
    e.event = [self.listaEventos objectAtIndex:indexPath.row];
    e.allowsEditing = YES;
    [self.navigationController pushViewController:e animated:YES];
    
}

- (IBAction)crearEvento:(id)sender {
    
    EKEventEditViewController * e = [EKEventEditViewController new];
    
    e.editViewDelegate = self;
    e.eventStore = self.almacenDeEventos;
    
    [self presentViewController:e animated:YES completion:nil];
    
}

-(void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action{
    
    NSError * error = nil;
    EKEvent * event = controller.event;
    
    switch (action) {
        case EKEventEditViewActionSaved:
            if (self.calendario == event.calendar) {
                [self.listaEventos addObject:event];
            }
            [controller.eventStore saveEvent:event span:EKSpanThisEvent error:&error];
            [self.tableView reloadData];
            break;
            
        case EKEventEditViewActionDeleted:
            if (self.calendario == event.calendar) {
                [self.listaEventos removeObject:event];
            }
            [controller.eventStore removeEvent:event span:EKSpanThisEvent error:&error];
            [self.tableView reloadData];
            break;
            
        case EKEventEditViewActionCanceled:
            break;
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}



-(EKCalendar *)eventEditViewControllerDefaultCalendarForNewEvents:(EKEventEditViewController *)controller{
    
    return self.calendario;
    
}

-(void)eventViewController:(EKEventViewController *)controller didCompleteWithAction:(EKEventViewAction)action{
    
    EKEvent * event = controller.event;
    
    switch (action) {
        case EKEventViewActionDeleted:
            if (self.calendario == event.calendar) {
                [self.listaEventos removeObject:event];
            }
            [self.tableView reloadData];
            break;
            
        case EKEventViewActionDone:
            break;
        case EKEventViewActionResponded:
            break;
    }
    
    [controller.navigationController popViewControllerAnimated:YES];
    
}











@end

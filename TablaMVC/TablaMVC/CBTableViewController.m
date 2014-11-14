//
//  CBTableViewController.m
//  TablaMVC
//
//  Created by Carlos on 12/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBTableViewController.h"
#import "CBContacto.h"
#import "CBDetalleViewController.h"

@interface CBTableViewController ()
- (IBAction)addContacto:(id)sender;

@property (strong, nonatomic) NSMutableArray * modelo;

@end

@implementation CBTableViewController

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

    self.modelo = [NSMutableArray new];
    
    CBContacto * c1 = [[CBContacto alloc] initWithNombre:@"Nombre1" email:@"email1" telefono:@"telefono1"];
    CBContacto * c2 = [[CBContacto alloc] initWithNombre:@"Nombre2" email:@"email2" telefono:@"telefono2"];
    CBContacto * c3 = [[CBContacto alloc] initWithNombre:@"Nombre3" email:@"email3" telefono:@"telefono3"];
    
    NSLog(@"%@, %@, %@", c1.nombre, c1.email, c1.telefono);
    
    [self.modelo addObject:c1];
    [self.modelo addObject:c2];
    [self.modelo addObject:c3];
    
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.modelo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    CBContacto * c = [self.modelo objectAtIndex:indexPath.row];
    cell.textLabel.text = c.nombre;
    
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard * stb = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    CBDetalleViewController * c = [stb instantiateViewControllerWithIdentifier:@"detalle"];
    c.contacto = [self.modelo objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:c animated:YES];
    
}

- (IBAction)addContacto:(id)sender {
    UIStoryboard * stb = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    CBAddViewController * c = [stb instantiateViewControllerWithIdentifier:@"add"];
    c.delegado = self;
    [self presentViewController:c animated:YES completion:nil];
}

- (void) salvar:(CBContacto *)contacto{
    [self.modelo addObject:contacto];
    [self.tableView reloadData];
}


@end

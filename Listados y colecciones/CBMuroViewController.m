//
//  CBMuroViewController.m
//  Listados y colecciones
//
//  Created by Carlos on 23/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBMuroViewController.h"
#import "CBComment.h"
#import "CBCellText.h"
#import "CBCellPhoto.h"
#import "CBMarcoViewController.h"

@interface CBMuroViewController ()

@end

@implementation CBMuroViewController
@synthesize modelo = _modelo;


-(NSMutableArray * ) modelo{
    
    if (!_modelo){
        
        _modelo = [NSMutableArray new];
        
        CBComment * c;
        
        c = [CBComment new];
        c.contact = @"c1.png";
        c.name = @"Luis Alfredo Prado";
        c.type = CBTipoCommentText;
        c.text = @"¡Hola mundo! Esto es un comentario que puedo escribir en mi muro. :)";
        [_modelo addObject:c];
        
        c = [CBComment new];
        c.contact = @"c2.png";
        c.name = @"Santi Gómez";
        c.type = CBTipoCommentPhoto;
        c.photo = @"img0.png";
        [_modelo addObject:c];
        
        c = [CBComment new];
        c.contact = @"c3.png";
        c.name = @"Patricia Durela";
        c.type = CBTipoCommentPhoto;
        c.photo = @"img1.jpg";
        [_modelo addObject:c];
        
        c = [CBComment new];
        c.contact = @"c4.png";
        c.name = @"María del Mar Aguado";
        c.type = CBTipoCommentText;
        c.text = @"¡Hola mundo! Esto es un comentario que puedo escribir en mi muro. :)";
        [_modelo addObject:c];
        
        c = [CBComment new];
        c.contact = @"c1.png";
        c.name = @"Luis Alfredo Prado";
        c.type = CBTipoCommentPhoto;
        c.photo = @"img2.jpg";
        [_modelo addObject:c];
        
        c = [CBComment new];
        c.contact = @"c4.png";
        c.name = @"Luis Alfredo Prado";
        c.type = CBTipoCommentText;
        c.text = @"¡Hola mundo! Esto es un comentario que puedo escribir en mi muro. :)";
        [_modelo addObject:c];
        
        c = [CBComment new];
        c.contact = @"c3.png";
        c.name = @"Santi Gómez";
        c.type = CBTipoCommentPhoto;
        c.photo = @"img3.jpg";
        [_modelo addObject:c];
        
        c = [CBComment new];
        c.contact = @"c5.png";
        c.name = @"Patricia Durela";
        c.type = CBTipoCommentPhoto;
        c.photo = @"img4.jpg";
        [_modelo addObject:c];
        
        c = [CBComment new];
        c.contact = @"c2.png";
        c.name = @"María del Mar Aguado";
        c.type = CBTipoCommentText;
        c.text = @"¡Hola mundo! Esto es un comentario que puedo escribir en mi muro. :)";
        [_modelo addObject:c];
        
        c = [CBComment new];
        c.contact = @"c4.png";
        c.name = @"Luis Alfredo Prado";
        c.type = CBTipoCommentPhoto;
        c.photo = @"img5.png";
        [_modelo addObject:c];
        
    }
    
    return _modelo;
    
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
    CBComment * c = [self.modelo objectAtIndex:indexPath.row];
    
    if (c.type == CBTipoCommentText) {
        CBCellText * cell = [tableView dequeueReusableCellWithIdentifier:@"CellText" forIndexPath:indexPath];
        cell.imgUser.image = [UIImage imageNamed:c.contact];
        cell.lblUser.text = c.name;
        cell.lblComment.text = c.text;
        return cell;
    }
    
    if (c.type == CBTipoCommentPhoto) {
        CBCellPhoto * cell = [tableView dequeueReusableCellWithIdentifier:@"CellPhoto" forIndexPath:indexPath];
        cell.imgUser.image = [UIImage imageNamed:c.contact];
        cell.lblUser.text = c.name;
        cell.imgPhoto.image = [UIImage imageNamed:c.photo];
        return cell;
    }
    return nil;

}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CBComment * c = [self.modelo objectAtIndex:indexPath.row];
    if (c.type == CBTipoCommentText) {
        return 120;
    }
    
    if (c.type == CBTipoCommentPhoto) {
        return 300;
    }
    return -1;
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

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"showPhoto"]){
        CBMarcoViewController  * destino = segue.destinationViewController;
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        CBComment * c = [self.modelo objectAtIndex:indexPath.row];
        destino.imageFile = c.photo;
    }
    
}











@end

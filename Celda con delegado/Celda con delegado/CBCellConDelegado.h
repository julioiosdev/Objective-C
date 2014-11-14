//
//  CBCellConDelegado.h
//  Celda con delegado
//
//  Created by Carlos on 13/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Mensajes


-(void)mostrarMensaje:(NSString *) msg;

@end

@interface CBCellConDelegado : UITableViewCell
- (IBAction)delegar:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblNombre;

@property (strong, nonatomic) id<Mensajes> delegado;

@end

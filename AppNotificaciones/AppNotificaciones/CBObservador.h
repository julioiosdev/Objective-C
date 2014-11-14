//
//  CBObservador.h
//  AppNotificaciones
//
//  Created by Carlos on 16/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBObservador : NSObject

@property (strong, nonatomic) NSString * nombre;

- (id) initWithNombre: (NSString *) nombre
         notificacion: (NSString *) notificacion;

@end

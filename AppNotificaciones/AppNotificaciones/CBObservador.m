//
//  CBObservador.m
//  AppNotificaciones
//
//  Created by Carlos on 16/03/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBObservador.h"

@implementation CBObservador

- (id) initWithNombre: (NSString *) nombre
         notificacion: (NSString *) notificacion{
    
    if (self = [super init]) {
        self.nombre = nombre;
        NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(recibirNotificacion:)
                       name:notificacion
                     object:nil];
        
    }
    
    return self;
    
}

- (void) recibirNotificacion: (NSNotification *) notificacion{
    NSLog(@"El objeto %@ ha recibido la notificación %@", self.nombre, notificacion.name);
}

@end

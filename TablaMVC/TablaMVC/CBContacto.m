//
//  CBContacto.m
//  TablaMVC
//
//  Created by Carlos on 12/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBContacto.h"

@implementation CBContacto

- (id) initWithNombre: (NSString *) nom
                email: (NSString *) eml
             telefono: (NSString *) tel {
    
    if (self = [super init]) {
        
        _nombre = nom;
        _email = eml;
        _telefono = tel;
        
    }
    
    return self;
    
}

@end

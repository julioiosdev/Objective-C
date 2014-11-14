//
//  CBContacto.h
//  TablaMVC
//
//  Created by Carlos on 12/02/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBContacto : NSObject

@property (strong, nonatomic) NSString * nombre;
@property (strong, nonatomic) NSString * telefono;
@property (strong, nonatomic) NSString * email;

- (id) initWithNombre: (NSString *) nom
                email: (NSString *) eml
             telefono: (NSString *) tel;

@end

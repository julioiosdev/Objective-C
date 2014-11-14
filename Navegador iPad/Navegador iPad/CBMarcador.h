//
//  CBMarcador.h
//  Navegador iPad
//
//  Created by Carlos on 07/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBMarcador : NSObject

@property (strong) NSString * titulo;
@property (strong) NSString * url;

-(id)initWithTitulo:(NSString *) titulo URL:(NSString *) url;

@end

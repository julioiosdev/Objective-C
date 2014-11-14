//
//  CBMarcador.m
//  Navegador iPad
//
//  Created by Carlos on 07/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBMarcador.h"

@implementation CBMarcador

-(id)initWithTitulo:(NSString *)titulo URL:(NSString *)url{
    
    
    if (self=[super init]) {
        self.titulo = titulo;
        self.url = url;
    }
    
    return self;
    
}

@end

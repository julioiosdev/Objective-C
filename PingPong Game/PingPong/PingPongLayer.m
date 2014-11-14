//
//  PingPongLayer.m
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "PingPongLayer.h"
#import "Resultados.h"

@implementation PingPongLayer {
    
    int percentDestroyedBlocks; //en el resultado mostraremos el porcentaje de bloques destruidos
    NSString * destroyed;
    
    NSUserDefaults *userDefaults;  //para guardar el resultado y recogerlo desde la escena de resultados
    
}

- (id)init
{
    
    destroyed =@"%"; //para la puntuacion
    
	if ((self = [super init]) == nil) return nil;
    
    
    //Añadimos el fondo
    CCSprite * fondo = [[[CCSprite alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:@"fondo.png"]] autorelease];
    
    fondo.position = CGPointMake(160.0f, 240.0f);
    
    [self addChild:fondo];
    
    
    
    //parametros de la partida, lo usaremos para los resultados del juego
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    percentDestroyedBlocks = 0; //puntuacion
    
    
    
    //Añadimos los bloques con el formato de la practica 4
    //rellenamos primero de arriba hacia abajo por columnas y de 3 en 3 hasta completar todas las columnas/filas
    
    self.bloques = [[NSMutableArray alloc] initWithCapacity:48];
    
    
    //Colores para los bloques
    NSArray *myArray = @[@"bloque_rojo.png", @"bloque_verde.png", @"bloque_azul.png"];
    
    //Control de color de celda
    int k=0;
    int tag=0; //identificador del bloque
    
    int desplazamientoHorizontal=0;
    
    int desplazamientoVertical=0;
    
    for(int i = 0; i < 6; i++) {
        
        desplazamientoHorizontal=desplazamientoHorizontal+52;
        
        desplazamientoVertical=0;
        
        for(int j = 0; j < 8; j++) {
            tag++;
            self.bloque = [[[Bloque alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:[myArray objectAtIndex:k]]] autorelease];
            
            self.bloque.position = ccp(-22+desplazamientoHorizontal, 465-desplazamientoVertical);
            
            self.bloque.tag = tag;  //identificador del bloque
            
            [self.bloques addObject:self.bloque];
            
            [self addChild:self.bloque]; //Agregamos el bloque a la pantalla
            
            desplazamientoVertical=desplazamientoVertical+22;
            
            if ([myArray lastObject]==[myArray objectAtIndex:k])
                k=0;
            else
                k++;
            
        }
    }
    
    
    //Añadimos una pelota
	self.pelota = [[[Pelota alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:@"pelota.png"]] autorelease];
    
	self.pelota.position = CGPointMake(160.0f, 240.0f);
	self.pelota.velocidad = CGPointMake(100.0f, -400.0f);
    [self addChild:self.pelota];
    
    //Añadimos la raqueta
	self.raqueta = [[[Raqueta alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:@"raqueta.png"]] autorelease];
    
	self.raqueta.position = CGPointMake(160, 25);
    self.raqueta.atrapada = NO;
    [self addChild:self.raqueta];
    
    
	[self schedule:@selector(animar:)];
    
	return self;
}

- (void)animar:(ccTime)instante
{
    int tagblock;  //recogeremos el identificador del bloque que ha tocado la pelota
    
    
    
	[self.pelota mover:instante];
    
    [self.pelota comprobarContactoConRaqueta:self.raqueta];
    
    tagblock=[self.pelota comprobarContactoConBloque:self.bloques];
    
    
    if (tagblock!=0){
        [self removeChildByTag:tagblock cleanup:YES];  //quitamos el bloque que ha tocado la pelota
    }
    
    if (self.bloques.count==0) { //si ya no quedan bloques en el array
        
        percentDestroyedBlocks = 100; //asignamos el 100% a la puntuacion conseguida
        
        //recogemos los datos de la puntuacion y mostramos el cartel tipico de los juegos arcade
        [userDefaults setValue:[[NSString alloc] initWithFormat:@"You win!"]  forKey:@"texto"];

        [userDefaults setValue:[[NSString alloc] initWithFormat:@"%d %@ ",percentDestroyedBlocks, destroyed]  forKey:@"porcentaje"];
        [userDefaults synchronize];
        
        
        percentDestroyedBlocks = 0; //reiniciamos la puntuacion
        
        //escena contenedora de los resultados
        [[CCDirector sharedDirector] pushScene:[Resultados escena]]; //llamamos a la escena de resultados
    }
    
    if (self.pelota.position.y < self.pelota.radio){  //si la pelota no toca la raqueta y se pierde por el fondo
        
        percentDestroyedBlocks = ((48 - self.bloques.count) * 100)/48; //asignamos el porcentaje obtenido en funcion de los bloques que hemos conseguido eliminar
        
        //recogemos los datos de la puntuacion y mostramos el cartel tipico de los juegos arcade
        [userDefaults setValue:[[NSString alloc] initWithFormat:@"Game over!"]  forKey:@"texto"];

        [userDefaults setValue:[[NSString alloc] initWithFormat:@"%d %@ ",percentDestroyedBlocks, destroyed]  forKey:@"porcentaje"];
        [userDefaults synchronize];
        
        
        percentDestroyedBlocks = 0;  //reiniciamos la puntuacion
        
        [[CCDirector sharedDirector] pushScene:[Resultados escena]];  //llamamos a la escena de resultados
    }
    

}




+(CCScene *)escena{
    CCScene * escenaPingPong = [[CCScene alloc] init];
	[escenaPingPong addChild:[self node]];
    return escenaPingPong;
}

@end

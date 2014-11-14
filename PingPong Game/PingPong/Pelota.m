//
//  Pelota.m
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "Pelota.h"
#import "Bloque.h"

@implementation Pelota

@synthesize velocidad;

-(float)radio{
    
    return self.texture.contentSize.width / 2;
}

- (void)mover:(ccTime)instante
{
    
	self.position = ccpAdd(self.position, ccpMult(self.velocidad, instante));
    
	if (self.position.x > 320 - self.radio) {
		[self setPosition: ccp( 320 - self.radio, self.position.y)];
		velocidad.x *= -1;
	} else if (self.position.x < self.radio) {
		[self setPosition: ccp(self.radio, self.position.y)];
		velocidad.x *= -1;
	} else if (self.position.y > 480 - self.radio){
        [self setPosition: ccp( self.position.x, 480 - self.radio)];
		velocidad.y *= -1;
    }/* else if (self.position.y < self.radio){
      [self setPosition: ccp( self.position.x, self.radio)];
      velocidad.y *= -1;
      }*/
    
    
}


-(void)comprobarContactoConRaqueta:(Raqueta * )raqueta{
    
    CGRect paddleRect = raqueta.rect;
	paddleRect.origin.x += raqueta.position.x;
	paddleRect.origin.y += raqueta.position.y;
    
	float lowY = CGRectGetMinY(paddleRect);
	float midY = CGRectGetMidY(paddleRect);
	float highY = CGRectGetMaxY(paddleRect);
    
	float leftX = CGRectGetMinX(paddleRect);
	float rightX = CGRectGetMaxX(paddleRect);
    
	if (self.position.x > leftX && self.position.x < rightX) {
        
		BOOL contacto = NO;
		float angleOffset = 0.0f;
        
		if (self.position.y > midY && self.position.y <= highY + self.radio) {
			self.position = CGPointMake(self.position.x, highY + self.radio);
			contacto = YES;
			angleOffset = (float)M_PI / 2;
		}
        
		else if (self.position.y < midY && self.position.y >= lowY - self.radio) {
			self.position = CGPointMake(self.position.x, lowY - self.radio);
			contacto = YES;
			angleOffset = -(float)M_PI / 2;
		}
        
		if (contacto) {
  
			float anguloDeContacto = ccpToAngle(ccpSub(raqueta.position, self.position)) + angleOffset;
            
			float angulo = -ccpToAngle(self.velocidad) + 0.5f * anguloDeContacto;
			self.velocidad = ccpMult(ccpForAngle(angulo), ccpLength(self.velocidad));
            
        }
	}
    
    
}

-(int)comprobarContactoConBloque:(NSMutableArray *)bloques{
    
    int tag=0;
    
    for(int i=0;i<bloques.count;i++){
        
        Bloque * bloque = [bloques objectAtIndex:i];
        
        CGRect paddleRect = bloque.rect;
        paddleRect.origin.x += bloque.position.x;
        paddleRect.origin.y += bloque.position.y;
        
        float lowY = CGRectGetMinY(paddleRect);
        float midY = CGRectGetMidY(paddleRect);
        float highY = CGRectGetMaxY(paddleRect);
        
        float leftX = CGRectGetMinX(paddleRect);
        float rightX = CGRectGetMaxX(paddleRect);
        
        if (self.position.x > leftX && self.position.x < rightX) {
            
            BOOL contacto = NO;
            float angleOffset = 0.0f;
            
            if (self.position.y > midY && self.position.y <= highY + self.radio) {
                self.position = CGPointMake(self.position.x, highY + self.radio);
                contacto = YES;
                angleOffset = (float)M_PI / 2;
            }
            
            else if (self.position.y < midY && self.position.y >= lowY - self.radio) {
                self.position = CGPointMake(self.position.x, lowY - self.radio);
                contacto = YES;
                angleOffset = -(float)M_PI / 2;
            }
            
            if (contacto) {
                
                tag=bloque.tag;
                
                
                
                //Cambiamos trayectoria a la direccion contraria
                float anguloDeContacto = ccpToAngle(ccpSub(bloque.position, self.position)) + angleOffset;
                
                float angulo = -ccpToAngle(self.velocidad) + 0.5f * anguloDeContacto;
                self.velocidad = ccpMult(ccpForAngle(angulo), ccpLength(self.velocidad));
                
                //fin bucle
                i=bloques.count;
                
                [bloques removeObject:bloque];  //eliminamos el bloque tocado del array
                
            }
        }
        
    }
    return tag;  //devolvemos el bloque que ha tocado la pelota
}

@end


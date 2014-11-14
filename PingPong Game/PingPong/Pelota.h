//
//  Pelota.h
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "cocos2d.h"
#import "Raqueta.h"
#import "Bloque.h"

@interface Pelota : CCSprite

@property(nonatomic) CGPoint velocidad;
@property (nonatomic) float radio;

- (void)mover:(ccTime)instante;

-(void)comprobarContactoConRaqueta:(Raqueta * )raqueta;
-(int)comprobarContactoConBloque:(NSMutableArray *)bloques;

@end

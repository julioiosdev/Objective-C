//
//  PingPongLayer.h
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "cocos2d.h"
#import "Pelota.h"
#import "Raqueta.h"
#import "Bloque.h"
@interface PingPongLayer : CCLayer

@property (nonatomic,retain)    Pelota *    pelota;
@property (nonatomic,retain)    Raqueta *    raqueta;
@property (nonatomic,retain)    Bloque *    bloque;

@property(nonatomic,retain) NSMutableArray * bloques;

+(CCScene *)escena;
    
@end

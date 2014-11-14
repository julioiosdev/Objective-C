//
//  Resultados.m
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "Resultados.h"
#import "AppDelegate.h"
#import "HelloWorldLayer.h"



@implementation Resultados

+(CCScene *)escena{
    CCScene * escenaResultados = [[CCScene alloc] init];
	[escenaResultados addChild:[self node]];
    return escenaResultados;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
    if( (self=[super init]) ) {
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        //Añadimos el fondo
        CCSprite * fondo = [[[CCSprite alloc] initWithTexture:[[CCTextureCache sharedTextureCache] addImage:@"fondoOscuro.png"]] autorelease];
        
        fondo.position = CGPointMake(160.0f, 240.0f);
        
        [self addChild:fondo];
        
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        //Mensaje de fin de partida
		CCLabelTTF *label = [CCLabelTTF labelWithString:[userDefaults valueForKey:@"texto"] fontName:@"AppleGothic" fontSize:36];
		label.position =  ccp( size.width /2 , size.height/2 + 40);
		[self addChild: label];
		
        

        
        //Mensaje con el porcentaje de bloques destruidos
		label = [CCLabelTTF labelWithString: [userDefaults valueForKey:@"porcentaje"] fontName:@"AppleGothic" fontSize:32];
        label.position =  ccp( size.width /2 , size.height/2 - 30);
		[self addChild: label];
        
        //Mensaje añadido 'destroyed'
		label = [CCLabelTTF labelWithString:@"Destroyed" fontName:@"AppleGothic" fontSize:24];
        label.position =  ccp( size.width /2 , size.height/2 - 70);
		[self addChild: label];
        
        
        
        //Creamos un menu
		[CCMenuItemFont setFontSize:28];
        
		CCMenuItem *itemJugar = [CCMenuItemFont itemWithString:@"Inicio" block:^(id sender) {
			
            //Volvemos a la pantalla de inicio del juego
			[[CCDirector sharedDirector] pushScene:[HelloWorldLayer scene]];
            
            //reseteamos los valores usuados para mostrar los resultados
            [userDefaults setValue:[[NSString alloc] initWithFormat:@""] forKey:@"texto"];
            [userDefaults setValue:[[NSString alloc] initWithFormat:@""] forKey:@"porcentaje"];
            [userDefaults synchronize];
            
            
		}];
        
        
        CCMenu *menu = [CCMenu menuWithItems:itemJugar,nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 -  200)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

@end

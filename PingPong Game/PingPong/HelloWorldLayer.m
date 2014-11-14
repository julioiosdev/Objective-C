//
//  HelloWorldLayer.m
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "PingPongLayer.h"
#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
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
        
        //Añadimos "PingPong"
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"PingPong" fontName:@"AppleGothic" fontSize:64];
		label.position =  ccp( size.width /2 , size.height/2);
		[self addChild: label];
		
        
        // Añadimos "Curso iOS"
		label = [CCLabelTTF labelWithString:@"Carlos Butron" fontName:@"AppleGothic" fontSize:32];
        label.position =  ccp( size.width /2 , size.height/2 - 50);
        
		[self addChild: label];
		
		
        
        //Creamos un menu
		[CCMenuItemFont setFontSize:28];
        
		CCMenuItem *itemJugar = [CCMenuItemFont itemWithString:@"Jugar" block:^(id sender) {
			
			[[CCDirector sharedDirector] pushScene:[PingPongLayer escena]];
            
			
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

//
//  Raqueta.h
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "cocos2d.h"

@interface Raqueta : CCSprite <CCTouchOneByOneDelegate>

@property (nonatomic)           BOOL   atrapada;
@property (nonatomic, readonly) CGRect rect;
@property (nonatomic, readonly) CGRect rectInPixels;

@end


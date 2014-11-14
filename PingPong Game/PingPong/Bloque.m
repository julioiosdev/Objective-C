//
//  Bloque.m
//  PingPong
//
//  Created by Carlos Butron on 25/05/14.
//

#import "Bloque.h"

@implementation Bloque

- (CGRect)rectInPixels
{
	CGSize s = [self.texture contentSizeInPixels];
	return CGRectMake(-s.width / 2, -s.height / 2, s.width, s.height);
}

- (CGRect)rect
{
	CGSize s = [self.texture contentSize];
	return CGRectMake(-s.width / 2, -s.height / 2, s.width, s.height);
}



@end

//
//  PhaseExecutor.m
//  Battle
//
//  Created by U-no on 12/10/14.
//
//

#import "PhaseExecutor.h"

@implementation PhaseExecutor

- (id)init
{
	self = [super init];
	if(self)
	{
		_player = nil;
		_enemy = nil;
	}
	return self;
}

- (void)dealloc
{
	[_player release];
	[_enemy release];
	
	[super dealloc];
}

- (void)setPlayer:(id)player
{
	if(_player)
	{
		[_player release];
	}
	_player = [player retain];
}

- (void)setEnemy:(id)enemy
{
	if(_enemy)
	{
		[_enemy release];
	}
	_enemy = [enemy retain];
}


- (void)executeJudge
{
	
}

- (NSString*)message
{
	return nil;
}

@end

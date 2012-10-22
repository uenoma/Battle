//
//  MainModel.m
//  Battle
//
//  Created by U-no on 12/10/15.
//
//

#import "MainModel.h"

static MainModel* sModel = nil;

@implementation MainModel

@synthesize _selectedStatusKind;

+ (id)model
{
	if(sModel == nil)
	{
		sModel = [[MainModel alloc] init];
	}
	return sModel;
}

- (id)init
{
	self = [super init];
	{
		_selectedStatusKind = 0;
		_player = nil;
		_enemy = nil;
	}
	return self;
}

- (void)dealloc
{
	[super dealloc];
}

- (void)setPlayer:(PlayerModel*)player
{
	if(_player)
	{
		[_player release];
	}
	_player = [player retain];
}

- (PlayerModel*)player
{
	return _player;
}

- (void)setEnemy:(PlayerModel*)enemy
{
	if(_enemy)
	{
		[_enemy release];
	}
	_enemy = [enemy retain];
}

- (PlayerModel*)enemy
{
	return _enemy;
}
@end

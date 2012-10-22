//
//  BattleExecutor.m
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BattleExecutor.h"
#import "BattleModel.h"
#import "PlayerModel.h"
#import "PhaseSearchExecutor.h"

@interface BattleExecutor(Private)
@end

@implementation BattleExecutor(Private)

@end

@implementation BattleExecutor

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

- (void)execute
{
	BattleModel* battle = [BattleModel model];

	// フェーズ設定
	PhaseSearchExecutor* searchExecutor = [[PhaseSearchExecutor alloc] init];
	[battle addPhaseExecutor:searchExecutor];
	[searchExecutor release];

	
	[NSThread detachNewThreadSelector:@selector(executeTask) toTarget:self withObject:self];
	
}

- (void)executeTask
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	
	float wait = 0.5f;
	
	BattleModel* battle = [BattleModel model];
	
	NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
	
	
	[notificationCenter postNotificationName:@"BATTLE_MESSAGE" object:@"戦闘開始\n" userInfo:nil];

	NSString* message = nil;
	for (int turn = 1; turn <= battle._turnNum; turn++)
	{
		NSAutoreleasePool* innerPool = [[NSAutoreleasePool alloc] init];
	
		message = [NSString stringWithFormat:@"%dターン\n", turn];
		[notificationCenter postNotificationName:@"BATTLE_MESSAGE" object:message userInfo:nil];
		
		for (int phaseIndex = 0; phaseIndex < [battle phaseNum]; phaseIndex++)
		{
			PhaseExecutor* phaseExecutor = [battle pahseAtIndex:phaseIndex];

			// 判定前メッセージ
			NSString* preMessage = [phaseExecutor message];
			[notificationCenter postNotificationName:@"BATTLE_MESSAGE" object:preMessage userInfo:nil];
			
			// 判定
			[phaseExecutor executeJudge];
			
			NSString* afterMessage = [phaseExecutor message];
			[notificationCenter postNotificationName:@"BATTLE_MESSAGE" object:afterMessage userInfo:nil];
			
		}

		[innerPool release];
	}
	
	[notificationCenter postNotificationName:@"BATTLE_MESSAGE" object:@"戦闘終了\n" userInfo:nil];
	[NSThread sleepForTimeInterval:wait];

	[notificationCenter postNotificationName:@"BATTLE_FINISHED" object:nil userInfo:nil];

	[pool release];
	
	[NSThread exit];
}

- (IBAction)pushStart:(id)sender
{
	[self execute];
}

@end

//
//  BattleExecutor.h
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlayerModel;

@interface BattleExecutor : NSObject
{
	PlayerModel*	_player;
	PlayerModel*	_enemy;
}
- (void)setPlayer:(id)player;
- (void)setEnemy:(id)enemy;
- (void)execute;
@end

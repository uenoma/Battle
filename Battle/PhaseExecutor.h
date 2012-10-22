//
//  PhaseExecutor.h
//  Battle
//
//  Created by U-no on 12/10/14.
//
//

#import <Foundation/Foundation.h>

@class PlayerModel;

@interface PhaseExecutor : NSObject
{
	PlayerModel*	_player;
	PlayerModel*	_enemy;
	
}
- (void)setPlayer:(id)player;
- (void)setEnemy:(id)enemy;
- (void)executeJudge;
- (NSString*)message;
@end

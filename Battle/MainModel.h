//
//  MainModel.h
//  Battle
//
//  Created by U-no on 12/10/15.
//
//

#import <Foundation/Foundation.h>

#import "PlayerModel.h"

@interface MainModel : NSObject
{
	PlayerModel* _player;
	PlayerModel* _enemy;
	
	int _selectedStatusKind;
}
@property (nonatomic, assign) int _selectedStatusKind;

+ (id)model;
- (void)setPlayer:(PlayerModel*)player;
- (PlayerModel*)player;
- (void)setEnemy:(PlayerModel*)enemy;
- (PlayerModel*)enemy;

@end

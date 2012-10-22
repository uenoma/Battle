//
//  PlayerModel.h
//  Battle
//
//  Created by U-no on 12/10/14.
//
//

#import <Foundation/Foundation.h>
#import "BattleDefine.h"

@class CustomData;

@interface PlayerModel : NSObject
{
	CustomData*	_unitModel;
	
	int _customPoint;
}
@property (nonatomic, retain) CustomData* _unitModel;
@property (nonatomic, assign) int _customPoint;

- (void)setUnitType:(UnitType)unitType;

@end

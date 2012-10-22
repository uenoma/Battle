//
//  UnitModel.h
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Widget.h"

#import "BattleDefine.h"

@interface UnitModel : Widget
{
	int	_speed;
	int	_armor;
	int _dcp;
	int _dur;
	int _sensor;
	int _avoid;
	int _shooting;
	int _grapple;
	
}
//@property (nonatomic, assign) int _armor;
//@property (nonatomic, assign) int _dcp;
//@property (nonatomic, assign) int _dur;
//@property (nonatomic, assign) int _sensor;
//@property (nonatomic, assign) int _avoid;
//@property (nonatomic, assign) int _shooting;
//@property (nonatomic, assign) int _grapple;

- (id)initWithUnitType:(UnitType)unitType;

- (int)baseValueAtType:(StatusType)type;
- (int)baseValueTotal;
@end

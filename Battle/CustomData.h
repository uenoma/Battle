//
//  CustomData.h
//  Battle
//
//  Created by U-no on 12/10/15.
//
//

#import <UIKit/UIKit.h>
#import "UnitModel.h"


@interface CustomData : UnitModel
{
	int	_c_Speed;
	int	_c_Armor;
	int _c_Dcp;
	int _c_Dur;
	int _c_Sensor;
	int _c_Avoid;
	int _c_Shooting;
	int _c_Grapple;
}
- (void)setCustomValue:(int)value type:(StatusType)type;

- (int)customValueAtType:(StatusType)type;
- (int)customValueTotal;

@end

//
//  CustomData.m
//  Battle
//
//  Created by U-no on 12/10/15.
//
//

#import "CustomData.h"
#import "BattleDefine.h"
#import "MainModel.h"
#import "SoundModel.h"

@implementation CustomData

- (id)initWithUnitType:(UnitType)unitType
{
	self = [super initWithUnitType:unitType];
	if(self)
	{
		_c_Armor = 0;
		_c_Dcp = 0;
		_c_Dur = 0;
		_c_Sensor = 0;
		_c_Avoid = 0;
		_c_Shooting = 0;
		_c_Grapple = 0;
	}
	return self;
}

- (void)setCustomValue:(int)value type:(StatusType)type
{
	int baseValue = [self baseValueAtType:type];
	if(((baseValue + value) > CustomizeValueMax) |
	   (value < 0))
	{
		return;
	}
	
	int total = [self customValueTotal];
	total -= [self customValueAtType:type];
	total += value;
	
	MainModel* mainModel = [MainModel model];
	PlayerModel* player = [mainModel player];
	
	if(total > player._customPoint)
	{
		return;
	}
	
	switch (type)
	{
		case StatusType_Speed:
		{
			_c_Speed = value;
			break;
		}
		case StatusType_Armor:
		{
			_c_Armor = value;
			break;
		}
		case StatusType_Dcp:
		{
			_c_Dcp = value;
			break;
		}
		case StatusType_Dur:
		{
			_c_Dur = value;
			break;
		}
		case StatusType_Sensor:
		{
			_c_Sensor = value;
			break;
		}
		case StatusType_Avoid:
		{
			_c_Avoid = value;
			break;
		}
		case StatusType_Shooting:
		{
			_c_Shooting = value;
			break;
		}
		case StatusType_Grapple:
		{
			_c_Grapple = value;
			break;
		}
			
		default:
			break;
	}
	
[[SoundModel model] pi];
}

- (int)customValueAtType:(StatusType)type
{
	int value = 0;
	switch (type)
	{
		case StatusType_Speed:
		{
			value = _c_Speed;
			break;
		}
		case StatusType_Armor:
		{
			value = _c_Armor;
			break;
		}
		case StatusType_Dcp:
		{
			value = _c_Dcp;
			break;
		}
		case StatusType_Dur:
		{
			value = _c_Dur;
			break;
		}
		case StatusType_Sensor:
		{
			value = _c_Sensor;
			break;
		}
		case StatusType_Avoid:
		{
			value = _c_Avoid;
			break;
		}
		case StatusType_Shooting:
		{
			value = _c_Shooting;
			break;
		}
		case StatusType_Grapple:
		{
			value = _c_Grapple;
			break;
		}
			
		default:
			break;
	}
	return value;
}

- (int)customValueTotal
{
	int total = 0;
	for(int i = 0; i < StatusCount; i++)
	{
		total += [self customValueAtType:i];
	}
	return total;
}

@end

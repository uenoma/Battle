//
//  UnitModel.m
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UnitModel.h"

@implementation UnitModel

//@synthesize _armor;
//@synthesize _dcp;
//@synthesize _dur;
//@synthesize _sensor;
//@synthesize _avoid;
//@synthesize _shooting;
//@synthesize _grapple;

- (id)initWithUnitType:(UnitType)unitType;
{
	self = [super init];
	if(self)
	{
		_speed = 0;
		_armor = 0;
		_dcp = 0;
		_dur = 0;
		_sensor = 0;
		_avoid = 0;
		_shooting = 0;
		_grapple = 0;

		NSBundle* bundle = [NSBundle mainBundle];
		NSString* resourcePath = [bundle resourcePath];
		NSString* dicPath = [resourcePath stringByAppendingPathComponent:@"UnitData.plist"];
		
		NSDictionary* unitDic = [NSDictionary dictionaryWithContentsOfFile:dicPath];
		NSArray* unitList = [unitDic objectForKey:UnitListKey];
		NSEnumerator* enumerator = [unitList objectEnumerator];
		NSDictionary* unitData = nil;
		while(unitData = [enumerator nextObject])
		{
			UnitType type = [[unitData objectForKey:UnitTypeKey] intValue];
			if(type == unitType)
			{
				_type = type;
				_name = [[unitData objectForKey:UnitNameKey] retain];
				
				NSDictionary* status = [unitData objectForKey:UnitStatusKey];
				
				_speed = [[status objectForKey:UnitSpeedKey] intValue];
				_armor = [[status objectForKey:UnitArmorKey] intValue];
				_dcp = [[status objectForKey:UnitDcpKey] intValue];
				_dur = [[status objectForKey:UnitDurKey] intValue];
				_sensor = [[status objectForKey:UnitSensorKey] intValue];
				_avoid = [[status objectForKey:UnitAvoidKey] intValue];
				_shooting = [[status objectForKey:UnitShootingKey] intValue];
				_grapple = [[status objectForKey:UnitGrappleKey] intValue];
				break;
			}
		}
		
	}
	return self;
}

- (int)baseValueAtType:(StatusType)type
{
	int value = 0;
	switch (type)
	{
		case StatusType_Speed:
		{
			value = _speed;
			break;
		}
		case StatusType_Armor:
		{
			value = _armor;
			break;
		}
		case StatusType_Dcp:
		{
			value = _dcp;
			break;
		}
		case StatusType_Dur:
		{
			value = _dur;
			break;
		}
		case StatusType_Sensor:
		{
			value = _sensor;
			break;
		}
		case StatusType_Avoid:
		{
			value = _avoid;
			break;
		}
		case StatusType_Shooting:
		{
			value = _shooting;
			break;
		}
		case StatusType_Grapple:
		{
			value = _grapple;
			break;
		}
			
		default:
			break;
	}
	return value;
}

- (int)baseValueTotal
{
	int total = 0;
	for(int i = 0; i < StatusCount; i++)
	{
		total += [self baseValueAtType:i];
	}
	return total;
}
@end

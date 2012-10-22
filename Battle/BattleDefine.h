//
//  BattleDefine.h
//  Battle
//
//  Created by U-no on 12/10/15.
//
//

#ifndef Battle_BattleDefine_h
#define Battle_BattleDefine_h

#define CustomizeValueMax 10


#define StatusCount 7
typedef enum StatusType
{
	StatusType_Speed = 0,
	StatusType_Armor,
	StatusType_Dcp,
	StatusType_Dur,
	StatusType_Sensor,
	StatusType_Avoid,
	StatusType_Shooting,
	StatusType_Grapple
} StatusType;

typedef enum UnitType
{
	UnitType_Light = 0,
	UnitType_Normal,
	UnitType_Heavy
} UnitType;

static const NSString*	UnitListKey			= @"UnitList";
static const NSString*	UnitTypeKey			= @"UnitType";
static const NSString*	UnitStatusKey		= @"Status";
static const NSString*	UnitNameKey			= @"Name";
static const NSString*	UnitFilePathKey		= @"FilePath";

static const NSString*	UnitSpeedKey		= @"Speed";
static const NSString*	UnitArmorKey		= @"Armor";
static const NSString*	UnitDcpKey			= @"Dcp";
static const NSString*	UnitDurKey			= @"Dur";
static const NSString*	UnitSensorKey		= @"Sensor";
static const NSString*	UnitAvoidKey		= @"Avoid";
static const NSString*	UnitShootingKey		= @"Shooting";
static const NSString*	UnitGrappleKey		= @"Grapple";

#endif

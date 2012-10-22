//
//  PlayerModel.m
//  Battle
//
//  Created by U-no on 12/10/14.
//
//

#import "PlayerModel.h"
#import "CustomData.h"

@implementation PlayerModel

@synthesize _unitModel;
@synthesize _customPoint;

- (id)init
{
	self = [super init];
	if(self)
	{
		_unitModel = nil;
		_customPoint = 10;
	}
	return self;
}

- (void)setUnitType:(UnitType)unitType
{
	if(_unitModel == nil)
	{
		_unitModel = [[CustomData alloc] initWithUnitType:unitType];

	}

}

- (void)dealloc
{
	[_unitModel release];
	[super dealloc];
}
@end

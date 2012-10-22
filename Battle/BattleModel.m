//
//  BattleModel.m
//  Battle
//
//  Created by U-no on 12/10/14.
//
//

#import "BattleModel.h"
#import "PhaseExecutor.h"

static BattleModel* sModel = nil;

@implementation BattleModel

@synthesize _turnNum;


+ (id)model
{
	if(sModel == nil)
	{
		sModel = [[BattleModel alloc] init];
		
	}
	return sModel;
}

- (id)init
{
	self = [super init];
	{
		_turnNum = 3;
		_phaseExecutors = [[NSMutableArray alloc] initWithCapacity:0];
		
	}
	return self;
}

- (void)dealloc
{
	[_phaseExecutors removeAllObjects];
	[_phaseExecutors release];
	
	[super dealloc];
}

- (int)phaseNum
{
	return [_phaseExecutors count];
}

- (PhaseExecutor*)pahseAtIndex:(int)index
{
	return [_phaseExecutors objectAtIndex:index];
}

- (void)addPhaseExecutor:(PhaseExecutor*)phaseExecutor
{
	[_phaseExecutors addObject:phaseExecutor];
}

@end

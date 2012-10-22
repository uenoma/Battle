//
//  DiceModel.m
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DiceModel.h"

static DiceModel* sModel = nil;

@implementation DiceModel

+ (id)model
{
	if(sModel == nil)
	{
		sModel = [[DiceModel alloc] init];
	}
	return sModel;
}

- (id)init
{
	self = [super init];
	{
		srand((unsigned)time(NULL));
	}
	return self;
}

- (void)dealloc
{
	[super dealloc];
}

- (int)roll1d6
{
	int d1 = rand() % 6 + 1;
	
	return d1;
}

- (int)roll2d6
{
	int d1 = rand() % 6 + 1;
	int d2 = rand() % 6 + 1;
	
	return (d1 + d2);
}
@end

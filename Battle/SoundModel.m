//
//  SoundModel.m
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SoundModel.h"
#import "CSystemSoundManager.h"

static SoundModel* sModel = nil;

@implementation SoundModel

+ (id)model
{
	if(sModel == nil)
	{
		sModel = [[SoundModel alloc] init];
	}
	return sModel;
}

- (id)init
{
	self = [super init];
	{
		srand((unsigned)time(NULL));
		
		_soundPi = [[CSystemSoundManager alloc] initWithFile:@"pi.caf"];
	}
	return self;
}

- (void)dealloc
{
	[_soundPi release];
	
	[super dealloc];
}

- (void)pi
{
	[_soundPi play];
}

@end

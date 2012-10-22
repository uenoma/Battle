//
//  Widget.m
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Widget.h"

@implementation Widget

@synthesize _type;
@synthesize _name;

- (void)dealloc
{
	[_name release];
	
	[super dealloc];
}
@end

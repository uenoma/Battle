//
//  BattleMessageView.m
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BattleMessageView.h"
#import "SoundModel.h"

@implementation BattleMessageView

- (void)awakeFromNib
{
}

- (void)dealloc
{
	NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
	[notificationCenter removeObserver:self];
	
	[super dealloc];
}

- (void)setBattleMessage:(NSString*)message
{
	SoundModel* sound = [SoundModel model];
	[sound pi];
	
	if(message  == nil)
	{
		self.text = nil;
	}
	else
	{
		NSMutableString* string = [[NSMutableString alloc] initWithString:self.text];
		[string appendString:message];
		self.text = string;
		
		NSRange range = NSMakeRange(self.text.length - 1, 1);
		[self scrollRangeToVisible:range];
	}

	[self setNeedsDisplay];
}

@end

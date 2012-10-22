//
//  CSystemSoundManager.m
//  drum
//
//  Created by U-no on 10/10/21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CSystemSoundManager.h"


@implementation CSystemSoundManager
- (id)initWithFile:(NSString*)file
{
	self = [super init];
	if(self != nil)
	{
		NSString* path = [[NSBundle mainBundle] pathForResource:file ofType:@""];
		CFURLRef urlRef = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)path, kCFURLPOSIXPathStyle, false);
		AudioServicesCreateSystemSoundID(urlRef, &_soundID);
		CFRelease(urlRef);
	}
	return self;
}

- (void)play
{
	AudioServicesPlaySystemSound(_soundID);
}

- (void)dealloc
{
	AudioServicesDisposeSystemSoundID(_soundID);
	
	[super dealloc];
}
@end

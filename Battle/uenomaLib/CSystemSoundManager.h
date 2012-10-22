//
//  CSystemSoundManager.h
//  drum
//
//  Created by U-no on 10/10/21.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <AudioToolbox/AudioServices.h>


@interface CSystemSoundManager : NSObject {
	SystemSoundID	_soundID;
}
- (id)initWithFile:(NSString*)file;
- (void)play;

@end

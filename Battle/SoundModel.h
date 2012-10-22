//
//  SoundModel.h
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CSystemSoundManager;


@interface SoundModel : NSObject
{
	CSystemSoundManager* _soundPi;
}
+ (id)model;
- (void)pi;
@end

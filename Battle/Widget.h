//
//  Widget.h
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Widget : NSObject
{
	int	_type;
	NSString*	_name;
}
@property (nonatomic, assign) int _type;
@property (nonatomic, retain) NSString* _name;
@end

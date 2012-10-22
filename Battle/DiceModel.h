//
//  DiceModel.h
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DiceModel : NSObject
{
}
+ (id)model;
- (int)roll1d6;
- (int)roll2d6;

@end

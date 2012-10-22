//
//  BattleViewController.h
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BattleMessageView;
@class BattleExecutor;

@interface BattleViewController : UIViewController
{
	IBOutlet UIView*			_plotView;
	IBOutlet BattleMessageView*	_battleMessageView;
	
	BattleExecutor* _battleExecutor;
}

@end

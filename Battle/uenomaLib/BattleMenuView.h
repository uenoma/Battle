//
//  BattleMenuView.h
//  Battle
//
//  Created by U-no on 12/09/29.
//  Copyright (c) 2012年 uenoma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BattleMenuView : UIView
{
	int			_currentIndex;
	NSArray*	_items;
}
- (void)setItems:(NSArray*)items;
- (void)setCurrentIndex:(int)index;
@end

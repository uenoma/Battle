//
//  ViewController.h
//  Battle
//
//  Created by Ueno Masahiro on 12/07/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
	IBOutlet UIView*	_setupView;
}

- (IBAction)pushNewGame:(id)sender;
- (IBAction)pushLoadGame:(id)sender;
@end

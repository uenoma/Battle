//
//  BattleTabBarController.m
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BattleTabBarController.h"

@interface BattleTabBarController ()

@end

@implementation BattleTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveBattleFinishedNotification:) name:@"BATTLE_FINISHED" object:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.

	[[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	if([item tag] == 1)
	{
		[tabBar setHidden:YES];
	}
}

- (void)receiveBattleFinishedNotification:(NSNotification*)notification
{
	[self.tabBar setHidden:NO];
}

@end

//
//  BattleViewController.m
//  Battle
//
//  Created by Ueno Masahiro on 12/09/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BattleViewController.h"
#import "BattleExecutor.h"
#import "BattleMessageView.h"

@interface BattleViewController ()

@end

@implementation BattleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
	{
    
	}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
	[notificationCenter addObserver:self selector:@selector(receiveBattleMessageNotification:) name:@"BATTLE_MESSAGE" object:nil];
	
	_battleExecutor = nil;
	
	[_plotView setHidden:YES];
	
}

- (void)dealloc
{
	[super dealloc];
}

- (void)viewDidUnload
{
	[_battleExecutor release];
	

    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"BATTLE_MESSAGE" object:nil userInfo:nil];
	
//	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@""
//													message:@"Are you ready?"
//												   delegate:nil 
//										  cancelButtonTitle:@"OK" 
//										  otherButtonTitles:nil];
//	[alert setDelegate:self];
//	[alert show];
//	[alert release];
	
	if(_battleExecutor)
	{
		[_battleExecutor release];
		_battleExecutor = nil;
	}
	
	_battleExecutor = [[BattleExecutor alloc] init];
	[_battleExecutor execute];

}

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	BattleExecutor* battleExecutor = [[BattleExecutor alloc] init];
	[battleExecutor execute];
	[battleExecutor release];
}

#pragma mark --- notification ---
- (void)receiveBattleMessageNotification:(NSNotification*)notification
{
	[_battleMessageView performSelectorOnMainThread:@selector(setBattleMessage:) withObject:[notification object] waitUntilDone:YES];
}

@end

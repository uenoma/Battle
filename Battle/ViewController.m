//
//  ViewController.m
//  Battle
//
//  Created by Ueno Masahiro on 12/07/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[_setupView setHidden:YES];
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pushNewGame:(id)sender
{
	[_setupView setHidden:NO];
}

- (IBAction)pushLoadGame:(id)sender
{
}

- (void)viewDidDisappear:(BOOL)animated
{
	[_setupView setHidden:YES];
}
@end

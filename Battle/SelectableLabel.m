//
//  SelectableLabel.m
//  Battle
//
//  Created by U-no on 12/10/15.
//
//

#import "SelectableLabel.h"
#import "MainModel.h"

@implementation SelectableLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(didTouchNotification:)
												 name:@"TOUCH_LABEL"
											   object:nil];

	//タッチイベントを許可する
	self.userInteractionEnabled = YES;
	[self setMultipleTouchEnabled:YES];
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
	[super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	MainModel* model = [MainModel model];
	model._selectedStatusKind = [self tag];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"TOUCH_LABEL" object:self];
}

- (void)didTouchNotification:(NSNotification*)notification
{
	MainModel* model = [MainModel model];

	if(model._selectedStatusKind == [self tag])
	{
		[self setBackgroundColor:[UIColor blueColor]];
		[self setTextColor:[UIColor whiteColor]];
	}
	else
	{
		[self setBackgroundColor:[UIColor darkGrayColor]];
		[self setTextColor:[UIColor greenColor]];
	}
	[self setNeedsDisplay];
}

@end

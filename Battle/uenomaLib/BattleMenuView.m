//
//  BattleMenuView.m
//  Battle
//
//  Created by U-no on 12/09/29.
//  Copyright (c) 2012年 uenoma. All rights reserved.
//

#import "BattleMenuView.h"

static const int BMVIEW_MARGIN_X	= 10;
static const int BMVIEW_MARGIN_Y	= 10;
static const int BMVIEW_FONT_SIZE	= 10;


@interface BattleMenuView(Private)
- (void)createDummyData;
- (void)updateViewSize;

@end

@implementation BattleMenuView(Private)
- (void)createDummyData
{
	NSArray* items = [[NSArray alloc] initWithObjects:@"たたかう", @"じゅもん", @"どうぐ", @"にげる", @"帰って寝る", nil];
	[self setItems:items];
	[items release];
	
	[self updateViewSize];
	 
	_currentIndex = 0;
	
	[self setNeedsDisplay];
}

- (void)updateViewSize
{
	int maxLength = 0;
	NSEnumerator* enumerator = [_items objectEnumerator];
	NSString* item = nil;
	while(item = [enumerator nextObject])
	{
		if(maxLength < [item length])
		{
			maxLength = [item length];
		}
	}
	
	CGSize viewSize;
	viewSize.width = maxLength * BMVIEW_FONT_SIZE + BMVIEW_MARGIN_X * 4;
	viewSize.height = [_items count] * (BMVIEW_FONT_SIZE * 2) + (BMVIEW_MARGIN_X * 2);
	
	CGRect frame = [self frame];
	frame.size = viewSize;
	
	[self setFrame:frame];
}
@end

@implementation BattleMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		_items = nil;
		_currentIndex = -1;
		
		// TODO: for DEBUG
		[self createDummyData];
    }
    return self;
}

- (void)awakeFromNib
{
	_items = nil;
	_currentIndex = -1;
	
	// TODO: for DEBUG
	[self createDummyData];
}

- (void)setItems:(NSArray*)items
{
	if(_items)
	{
		[_items release];
	}
	_items = [items retain];
}

- (void)setCurrentIndex:(int)index
{
	_currentIndex = index;
}

- (void)drawRect:(CGRect)rect
{
	CGRect bounds = [self bounds];
	CGRect insetBounds = CGRectInset(bounds, BMVIEW_MARGIN_X, BMVIEW_MARGIN_Y);
	
	[[UIColor whiteColor] set];
	UIBezierPath* path = [UIBezierPath bezierPathWithRect:insetBounds];
	[path stroke];
	
	UIFont* font = [UIFont systemFontOfSize:BMVIEW_FONT_SIZE];
	
	CGRect dstRect = bounds;
	dstRect.origin.x = BMVIEW_MARGIN_X * 2 + (BMVIEW_MARGIN_X / 2);
	dstRect.origin.y = BMVIEW_MARGIN_Y * 2;
	
	int index = 0;
	NSEnumerator* enumerator = [_items objectEnumerator];
	NSString* item = nil;
	while(item = [enumerator nextObject])
	{
		if(index == _currentIndex)
		{
			CGRect cursorRect = dstRect;
			cursorRect.size.width = BMVIEW_FONT_SIZE;
			cursorRect.origin.x -= BMVIEW_FONT_SIZE;
			NSString* cursorString = @">";
			[cursorString drawInRect:cursorRect withFont:font];
		}
		[item drawInRect:dstRect withFont:font];
		
		dstRect.origin.y += BMVIEW_MARGIN_Y + (BMVIEW_MARGIN_Y / 2);
		index++;
	}
	
}

@end

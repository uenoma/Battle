//
//  ScaleView.m
//  Battle
//
//  Created by U-no on 12/10/14.
//
//

#import "ScaleView.h"
#import "MainModel.h"
#import "UnitModel.h"
#import "CustomData.h"
#import "BattleDefine.h"

@interface ScaleView(Private)
- (void)updateValueForTouches:(NSSet *)touches withEvent:(UIEvent *)event;

@end

@implementation ScaleView

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
	_value = 0;
	
	//タッチイベントを許可する
	self.userInteractionEnabled = YES;
	[self setMultipleTouchEnabled:YES];

}

- (void)drawRect:(CGRect)rect
{
	
	CGRect bounds = [self bounds];
	
	CGRect fillRect = bounds;
	
	UIBezierPath* bgPath = [UIBezierPath bezierPathWithRect:bounds];
	
	[[UIColor darkGrayColor] set];
	[bgPath fill];


	MainModel* mainModel = [MainModel model];
	PlayerModel* player = [mainModel player];
	if(player)
	{
		CustomData* unit = player._unitModel;
		int baseValue = [unit baseValueAtType:[self tag]];
		int customValue = [unit customValueAtType:[self tag]];

		fillRect.size.width = bounds.size.width / CustomizeValueMax * (baseValue + customValue);
		UIBezierPath* fillPath = [UIBezierPath bezierPathWithRect:fillRect];
		
		[[UIColor yellowColor] set];
		[fillPath fill];

		fillRect.size.width = bounds.size.width / CustomizeValueMax * baseValue;
		fillPath = [UIBezierPath bezierPathWithRect:fillRect];
		
		[[UIColor orangeColor] set];
		[fillPath fill];
		
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self updateValueForTouches:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self updateValueForTouches:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self updateValueForTouches:touches withEvent:event];
}

@end

@implementation ScaleView(Private)
- (void)updateValueForTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch* touch = [touches anyObject];
	CGPoint point = [touch locationInView:self];
	
	CGRect bounds = [self bounds];
	float scaleSize = bounds.size.width / CustomizeValueMax;
	int value = point.x / scaleSize + 1;
	
	MainModel* mainModel = [MainModel model];
	PlayerModel* player = [mainModel player];
	if(player)
	{
		CustomData* unit = player._unitModel;
		value -= [unit baseValueAtType:[self tag]];
		
		if(value != _value)
		{
			_value = value;

			[unit setCustomValue:_value type:[self tag]];
		}
		
	}
	[self setNeedsDisplay];

	[[NSNotificationCenter defaultCenter] postNotificationName:@"UPDATE_CUSTOMPOINT" object:self];
}

@end

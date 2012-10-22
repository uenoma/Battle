//
//  BattleModel.h
//  Battle
//
//  Created by U-no on 12/10/14.
//
//

#import <Foundation/Foundation.h>

@class PhaseExecutor;

@interface BattleModel : NSObject
{
	int	_turnNum;
	
	NSMutableArray* _phaseExecutors;
}
@property (nonatomic, assign) int _turnNum;

+ (id)model;

- (int)phaseNum;
- (PhaseExecutor*)pahseAtIndex:(int)index;
- (void)addPhaseExecutor:(PhaseExecutor*)phaseExecutor;
@end

//
//  EditViewController.m
//  Battle
//
//  Created by U-no on 12/09/30.
//
//

#import "EditViewController.h"
#import "MainModel.h"
#import "CustomData.h"

@interface EditViewController(Private)
- (void)update;
@end

@implementation EditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
	[super dealloc];
}

- (void)awakeFromNib
{
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(updateCustomPointNotification:)
												 name:@"UPDATE_CUSTOMPOINT"
											   object:nil];
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateCustomPointNotification:(NSNotification*)notification
{

	[self update];
}

- (void)viewWillAppear:(BOOL)animated
{
	[self update];

}

@end

@implementation EditViewController(Private)
- (void)update
{
	MainModel* mainModel = [MainModel model];
	PlayerModel* player = [mainModel player];
	CustomData* unit = player._unitModel;
	
	int total = player._customPoint;
	int current = total - [unit customValueTotal];
	
	NSString* string = [NSString stringWithFormat:@"%d / %d", current, total];
	[_labelCustomPoint setText:string];
	
}
@end



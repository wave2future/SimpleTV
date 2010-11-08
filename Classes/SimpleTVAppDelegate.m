#import "SimpleTVAppDelegate.h"
#import "RootViewController.h"


@implementation SimpleTVAppDelegate

+ (SimpleTVAppDelegate *)sharedDelegate
{
	return (SimpleTVAppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
	[navigationController release];
	[window release];
	[super dealloc];
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	RootViewController *rootViewController = [[RootViewController alloc] initWithStyle:UITableViewStylePlain];
	navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
	[rootViewController release];
	
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
	return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark -
#pragma mark Application's Documents directory

- (NSString *)applicationDocumentsDirectory
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


@synthesize window;
@synthesize navigationController;

@end


#import "RootViewController.h"

@implementation RootViewController

- (void)removeOutletsAndControls_RootViewController
{
    // remove and clean outlets and controls here
}

- (void)dealloc 
{
	[self removeOutletsAndControls_RootViewController];
	[channelArray release];
	[playerViewController release];
    [super dealloc];
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	[self removeOutletsAndControls_RootViewController];
}

/*
// The designated initializer.  Override if you create the controller
// programmatically and want to perform customization that is not appropriate 
// for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

#pragma mark -
#pragma mark UIViewContoller Methods

/*
// Implement loadView to create a view hierarchy programmatically, without
// using a nib.
- (void)loadView 
{
}
*/

- (void)viewDidLoad 
{
    [super viewDidLoad];
	if (!channelArray) {
		channelArray = [[NSMutableArray alloc] init];
		
#define c(a, b) [NSDictionary dictionaryWithObjectsAndKeys:a, @"name", b, @"URL", nil]
		[channelArray addObject:c(@"民視", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone1.m3u8")];
		[channelArray addObject:c(@"中天娛樂", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone2.m3u8")];
		[channelArray addObject:c(@"中天新聞", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone3.m3u8")];
		[channelArray addObject:c(@"民視新聞", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone4.m3u8")];
		[channelArray addObject:c(@"非凡商業", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone5.m3u8")];
		[channelArray addObject:c(@"壹電視", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone6.m3u8")];
		[channelArray addObject:c(@"大愛電視", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone7.m3u8")];
		[channelArray addObject:c(@"公共電視", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone8.m3u8")];
		[channelArray addObject:c(@"好消息", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone9.m3u8")];
		[channelArray addObject:c(@"緯來綜合", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone10.m3u8")];
		[channelArray addObject:c(@"東森購物", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone11.m3u8")];
		[channelArray addObject:c(@"LVXE TV", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone12.m3u8")];
		[channelArray addObject:c(@"緯來體育", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone13.m3u8")];
		[channelArray addObject:c(@"緯來育樂", @"http://mobiletvliveapple.veetv.com.tw/apple/iphone14.m3u8")];
	}	
}
- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated 
{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated 
{
	[super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated 
{
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [channelArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    NSDictionary *d = [channelArray objectAtIndex:indexPath.row];
	cell.textLabel.text = [d objectForKey:@"name"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	NSDictionary *d = [channelArray objectAtIndex:indexPath.row];
	NSString *URLString = [d objectForKey:@"URL"];
	NSURL *URL = [NSURL URLWithString:URLString];
	
	if (!playerViewController) {
		playerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:URL];
	}
	else {
		[playerViewController.moviePlayer setContentURL:URL];
	}
	[self presentMoviePlayerViewControllerAnimated:playerViewController];
	[playerViewController.moviePlayer play];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return nil;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
	return nil;
}

@end


@interface SimpleTVAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    UINavigationController *navigationController;
}

+ (SimpleTVAppDelegate *)sharedDelegate;
- (NSString *)applicationDocumentsDirectory;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end


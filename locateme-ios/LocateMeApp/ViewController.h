#import <UIKit/UIKit.h>
#import "WebApp.h"
#import "LocationController.h"
#import "LocationRequestHandler.h"


@interface ViewController : UIViewController <LocationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) WebApp *webApp;

- (id)initWithWebView:(UIWebView *)webView;

@end


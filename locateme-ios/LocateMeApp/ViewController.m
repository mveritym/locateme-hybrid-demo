#import "ViewController.h"

@implementation ViewController

- (id)initWithWebView:(UIWebView *)webView {
    NSLog(@"Initializing with web view");
    if ( self = [super init] ) {
        self.webView = webView;
        return self;
    } else {
        return nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createWebApp];
    [self registerRequestHandlers];
    
    LocationController *locationController = [LocationController sharedInstance];
    [locationController initLocationManagerWithDelegate:self];
}

- (void)createWebApp {
    self.webApp = [WebApp appWithWebView:self.webView];
}

- (void)registerRequestHandlers {
    [NSURLProtocol registerClass:[LocationRequestHandler class]];
}

- (void)locationUpdatedWithLat:(NSString *)latitude andLong:(NSString *)longtitude {
    [self.webApp reportLatitutude:(NSString *)latitude andLong:(NSString *)longtitude];
}

@end

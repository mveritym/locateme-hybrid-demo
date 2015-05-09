#import "WebApp.h"

@interface WebApp ()
@property BOOL webViewLoaded;
@end

@implementation WebApp

@synthesize webView;

+ (WebApp *) appWithWebView:(UIWebView *)webView {
    return [[WebApp alloc] initWithWebView:webView];
}

- (id) initWithWebView:(UIWebView *)view {
    self = [super init];
    if (nil != self) {
        self.webView = view;
        [self loadWebApp];
    }
    return self;
}

- (void) loadWebApp {
    NSString *path = @"http://localhost:3000/";
    NSURL *url = [NSURL URLWithString:path];
    
    [self.webView setDataDetectorTypes:UIDataDetectorTypeNone];
    [self.webView setDelegate:self];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)reportLatitutude:(NSString *)latitude andLong:(NSString *)longtitude {
    NSString *jsCallBack = [NSString stringWithFormat:@"reportLocation('%@', '%@')", latitude, longtitude];
    [self.webView stringByEvaluatingJavaScriptFromString:jsCallBack];
}

@end
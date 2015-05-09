#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WebApp : NSObject<UIWebViewDelegate>

@property(nonatomic, retain) UIWebView *webView;

+ (WebApp *) appWithWebView:(UIWebView *)webView;

- (id) initWithWebView:(UIWebView *)view;
- (void)reportLatitutude:(NSString *)latitude andLong:(NSString *)longtitude;

@end
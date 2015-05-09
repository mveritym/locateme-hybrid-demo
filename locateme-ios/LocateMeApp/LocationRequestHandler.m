#import "LocationRequestHandler.h"

@interface LocationRequestHandler ()

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) LocationController *location;

@end

@implementation LocationRequestHandler

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    return [request.URL.path caseInsensitiveCompare:@"/findMe"] == NSOrderedSame;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

- (void)startLoading {
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] init];
    [self responseWithStatus:200];
    self.location = [LocationController sharedInstance];
    [self.location startUpdatingLocation];
    [self finishLoadingResponse:response];
}

- (void)stopLoading {
    [self.connection cancel];
    self.connection = nil;
}

- (NSHTTPURLResponse *)responseWithStatus:(int)status {
    NSDictionary *header = @{@"Content-type": @"application/json"};
    return [[NSHTTPURLResponse alloc] initWithURL:self.request.URL statusCode:status HTTPVersion:@"1.1" headerFields:header];
}

- (void)finishLoadingResponse:(NSHTTPURLResponse *)response {
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    [self.client URLProtocolDidFinishLoading:self];
}

@end

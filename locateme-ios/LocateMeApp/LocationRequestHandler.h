#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "LocationController.h"

@interface LocationRequestHandler : NSURLProtocol <CLLocationManagerDelegate>

@end
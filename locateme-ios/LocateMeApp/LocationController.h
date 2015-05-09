#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationControllerDelegate <NSObject>

@optional

- (void)locationUpdatedWithLat:(NSString *)latitude andLong:(NSString *)longtitude;

@end

@interface LocationController : NSObject <CLLocationManagerDelegate>

+ (id)sharedInstance;
- (void)initLocationManagerWithDelegate:(id<LocationControllerDelegate>)locationDelegate;
- (void)startUpdatingLocation;

@end
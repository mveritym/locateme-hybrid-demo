#import "LocationController.h"

static LocationController *sharedLocationController = nil;

@interface LocationController ()

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) id<LocationControllerDelegate> locationDelegate;

@end

@implementation LocationController

+ (id)sharedInstance {
    if(!sharedLocationController) {
        sharedLocationController = [[LocationController alloc] init];
    }
    return sharedLocationController;
}

- (void)initLocationManagerWithDelegate:(id<LocationControllerDelegate>)locationDelegate {
    if (self.locationManager == nil) {
        NSLog(@"Initializing location manager!");
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.delegate = self;
        self.locationDelegate = locationDelegate;
        [self requestWhenInUseAuthorization];
    }
}

- (void)requestWhenInUseAuthorization {
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
}

- (void)startUpdatingLocation {
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"Locations updated");
    [self stopUpdatingLocation:[locations objectAtIndex:0]];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
}

- (void)stopUpdatingLocation:(CLLocation *)pos {
    NSString *latitude = [[NSNumber numberWithDouble:pos.coordinate.latitude] stringValue];
    NSString *longitude = [[NSNumber numberWithDouble:pos.coordinate.longitude] stringValue];
    
    [self.locationManager stopUpdatingLocation];
    [self.locationDelegate locationUpdatedWithLat:latitude andLong:longitude];
}

@end
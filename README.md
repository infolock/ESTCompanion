ESTCompanion
============

(WIP) - Finding there are some boiler plate setup stuff for working with Estimote's iOS SDK.  To make life easier, created some ways to avoid all the boiler plate setup.  Contributors needed!


# Categories
### ESTBeaconManager+UUIDGroup
This is a small category to just make setting up the ESTBeaconManager easier for when we want to start ranging for estimote beacons.

**Example Usage (.m file )**
```objc

#import "ESTBeaconManager+UUIDGroup.h"

static NSString * const DEFAULT_IDENTIFIER = @"estimoteIdentifier";

// Note: We're using the ESTBeaconManagerUUIDGroupDelegate here because we want to range immediately.  Otherwise, just use the default ESTBeaconManagerDelegate instead...
@interface ViewController () <ESTBeaconManagerUUIDGroupDelegate>

-(void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];

        self.beaconManager = [[ESTBeaconManager alloc] initWithOptions:kUUIDGroupInitOptionsAvoidUnknownStateBeacons | kUUIDGroupInitOptionsStartRangingImmediately 
                                                              delegate:self];
}

-(void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    [self.beaconManager stopRangingBeaconsInRegion];
}

// This become a completion block instead soon - for now, just using it as is...
-(void)beaconManager:(ESTBeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(ESTBeaconRegion *)region {
    self.beaconsArray = beacons;
    NSLog( @"wh00t - beacons : %@", beacons );
}

// This is ONLY needed if we are wanting to range immediately - in which case we have to be a ESTBeaconManagerUUIDGroupDelegate to do so...
-(NSArray *)ESTBeaconManagerDelegateShouldReturnUUIDIdentifierArray {
    // The order is import here for now as it is still a WIP.  For now, it is what it is.
    return @[ ESTIMOTE_PROXIMITY_UUID, DEFAULT_BEACON_IDENTIFIER ];
}

```

ESTCompanion
============

(WIP) - Finding there are some boiler plate setup stuff for working with [Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK).  To make life easier, created some ways to avoid all the boiler plate setup.  Contributors needed!


# Categories
### ESTBeaconManager+UUIDGroup
This is a small category to just make setting up the ESTBeaconManager easier for when we want to start ranging for estimote beacons.

**Very Simple Example of Usage (.m file )**
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

@end

```

So what's so special about this?
* No need for the ESTBeaconRegion property ( see details in sibling points below )
* No need to create an instance of the ESTBeaconRegion
* Ranging Starts Immediately without a need to do so ( this is optional of course, but is what I wanted/needed )
* When getting an instnace of the ESTBeaconManager, we can also (optionally) set ourselves as the delegate, and also turn on some properties immediately without having to issue calls for each of them

All of the above is achieved with 1 init call, and a single delegate method ( which is not going to even be necessary soon enough ).


#### Extras included
There are (quite a few) initialization points available for this guy too by means of `NS_OPTIONS`/`NS_ENUM` to keep things simple and yet expressive.

Quick Breakdown:
* `typedef NS_OPTIONS(NSUInteger, kUUIDGroupInitOptions)`
  * Available Options: 
    * `kUUIDGroupInitOptionsNone` - Nothing extra done - same as not even using this guy ( :~( )
    * `kUUIDGroupInitOptionsAvoidUnknownStateBeacons` - Enables the ESTBeaconManager property `avoidUnknownStateBeacons` ( sets to YES )
    * `kUUIDGroupInitOptionsStartRangingImmediately` - Discussed above.  Short Answer - removes boiler plate code for ranging.
* `typedef NS_ENUM(NSInteger, kUUIDGroupBy)`
  * Available Options: 
    * `kUUIDGroupByNone`  - Default ( 2D array containing only beacons with a specific UUID )
    * `kUUIDGroupByMajor` - Group all by the MAJOR value
    * `kUUIDGroupByCLProximity` - Group all by CLProximity ( keys will be: immediate, near, far, unknown )
* `typedef NS_ENUM(NSUInteger, kUUIDGroupSortBy)`
  * Available Options: 
    * `kUUIDGroupSortByDefault` - Default ( esimote defaults this array to be sorted by closest proximity/distance )
    * `kUUIDGroupSortByCLProximity` - Sort by CLProximity ( immediate -> near -> far -> unknown ) *WIP*
    * `kUUIDGroupSortByMajorMinor` - Sort by Major Value with the Minor Value being used for siblings having the same Major value

Checkout `ESTBeaconManager+UUIDGroup.h` for more.


## License
See `LICENSE` included with this repo.  Long story short - I'm a dev, you're a dev - we all make great stuff that works, but we also make shitty stuff that breaks...

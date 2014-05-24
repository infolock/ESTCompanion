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

##### Static/Category Methods

* `+(NSString *)stringFromProximity:(CLProximity)proximity` - Returns a string for a given `CLProximity` key
* `+(NSString *)nameFromProximity:(CLProximity)proximity` - Convenience method for `stringFromProximity` that is being used by others

##### Extras included
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


### ESTBeaconManager+BeaconStore
This category is simply a way to persist iBeacons found/altered during ranging to the `NSUserDefaults`.  The catch 22 to this is that the [Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK) already allows you to save that information to the actual iBeacons - which is not what this is attempting to solve/duplicate ( unless you actually want to that is... ).  The whole point behind this category is to allow you to store extra information about a beacon - such as the notification message you applied to a Zone event, or the physical location of the beacon, its identifier/name, etc...

This is just a generic first attempt at it - will refactor/expand on this as the use cases arise.  The hope is to allow support to multiple stores ( `NSUserDefaults`, `Core Data`, remote, etc. ).

This Category is influenced by the [iBeacon Article on Ray Wenderlich's site](http://www.raywenderlich.com/66584/ios7-ibeacons-tutorial).

##### Methods
* Methods that specify the storageType(s) by using `kBeaconStoreTypes`:
  * `+(void)storeBeaconsInArray:(NSArray *)beacons storeTypes:(kBeaconStoreTypes)storageTypes`
  * `+(void)storeBeaconsInArray:(NSArray *)beacons storeTypes:(kBeaconStoreTypes)storageTypes withStorageKeyName:(NSString *)keyName`
  * `+(NSArray *)retrieveBeaconsFromStorageTypes:(kBeaconStoreTypes)storageType`
  * `+(NSArray *)retrieveBeaconsFromStorageTypes:(kBeaconStoreTypes)storageType usingStorageKeyName:(NSString *)keyName`
* Methods that work with `NSUserDefaults`:
  * `+(void)writeToNSUserDefaultsUsingBeacons:(NSArray *)beacons`
  * `+(void)writeToNSUserDefaultsUsingBeacons:(NSArray *)beacons withStorageKeyName:(NSString *)keyName`
  * `+(NSArray *)retrieveBeaconsFromNSUserDefaults`
  * `+(NSArray *)retrieveBeaconsFromNSUserDefaultsUsingKeyWithName:(NSString *)keyName`

##### Extras
`typedef NS_ENUM( NSUInteger, kBeaconStoreInfo )` - Used to specify the storage type(s) to use when retrieving/saving beacons ( `kBeaconStoreInfoDefaultKeyName` is the only supported key right now.. )


# iBeacon Information/Resources
Here is a small compilation of good resources, information and repositories relating to iBeacons.

* [Estimote IOS-SDK](https://github.com/Estimote/iOS-SDK) - github repo
* [BEEKN](http://beekn.net) - Amazing site with all *kinds* of information relating to iBeacons
* [Developing iOS 7 Applications with iBeacons Tutorial](http://www.raywenderlich.com/66584/ios7-ibeacons-tutorial) - Ray Wenderlich
* [iBeacons Tutorial for iOS 7 with CLBeaconRegion and CLBeacon](http://www.devfright.com/ibeacons-tutorial-ios-7-clbeaconregion-clbeacon/) - DEVFRIGHT
* [A Closer Look at the CLLocationManagerDelegate](http://www.devfright.com/a-closer-look-at-the-cllocationmanagerdelegate/) - DEVFRIGHT
* [EstimoteEditor](https://github.com/ygini/EstimoteEditor) - github repo
* [HiBeacons](https://github.com/nicktoumpelis/HiBeacons) - github repo

# License
See `LICENSE` included with this repo.  Long story short - I'm a dev, you're a dev - we all make great stuff that works, but we also make shitty stuff that breaks...

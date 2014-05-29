ESTCompanion
============

(WIP) - Finding there are some boiler plate setup stuff for working with [Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK).  To make life easier, created some ways to avoid all the boiler plate setup.  Contributors needed!

### Requirements
[Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK) - see their README for installation instructions

> Note: the EstimoteSDK found within the Example may or may not be current.  You should not rely on it being the latest/greatest - rely on the link above instead!


### Installation
Pretty simple stuff: Copy the ESTCompanion folder into your project - and its ready for use.


# Categories
### ESTBeaconManager+UUIDGroup
This is a small category to just make setting up the ESTBeaconManager easier for when we want to start ranging for estimote beacons.

> Checkout the Example for a very simple usage example

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

Checkout `ESTBeaconManager+UUIDGroup.h` for more.


### ESTBeaconManager+BeaconStore
This category is simply a way to persist iBeacons found/altered during ranging to the `NSUserDefaults`.  The catch 22 to this is that the [Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK) already allows you to save that information to the actual iBeacons - which is not what this is attempting to solve/duplicate ( unless you actually want to that is... ).  This is just a easy way to store more information about them.

*This is just a generic first attempt at it - will refactor/expand on this as the use cases arise.  The hope is to allow support to multiple stores ( `NSUserDefaults`, `Core Data`, remote, etc. ).*

This Category is influenced by the [iBeacon Article on Ray Wenderlich's site](http://www.raywenderlich.com/66584/ios7-ibeacons-tutorial).

##### Methods
* `+(void)storeBeaconsInArray:(NSArray *)beacons storeTypes:(kBeaconStoreTypes)storageTypes`
* `+(void)storeBeaconsInArray:(NSArray *)beacons storeTypes:(kBeaconStoreTypes)storageTypes withStorageKeyName:(NSString *)keyName`
* `+(NSArray *)retrieveBeaconsFromStorageTypes:(kBeaconStoreTypes)storageType`
* `+(NSArray *)retrieveBeaconsFromStorageTypes:(kBeaconStoreTypes)storageType usingStorageKeyName:(NSString *)keyName`
* `+(void)writeToNSUserDefaultsUsingBeacons:(NSArray *)beacons`
* `+(void)writeToNSUserDefaultsUsingBeacons:(NSArray *)beacons withStorageKeyName:(NSString *)keyName`
* `+(NSArray *)retrieveBeaconsFromNSUserDefaults`
* `+(NSArray *)retrieveBeaconsFromNSUserDefaultsUsingKeyWithName:(NSString *)keyName`

##### Extras included
Checkout `ESTBeaconManager+BeaconStore.h` for more.


# Included Example
The included example is nothing special.  It is just a basic example showing how to use some of the features available.  Currently, it only shows how ot use the `GroupUUID` category.

Here is a screenshot for the curious:

![ScreenShot 1](/example_ss.png)


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

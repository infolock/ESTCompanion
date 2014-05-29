ESTCompanion
============

(WIP) - Finding there are some boiler plate setup stuff for working with [Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK).  To make life easier, created some ways to avoid all the boiler plate setup.

ToC
===
[Requirements](#requirements)  
[Installation](#installation)  
[Categories](#categories)  
* [ESTBeaconManager+UUIDGroup](#uuidgroup)  
* [ESTBeaconManager+BeaconStore](#beaconstore)  

[iBeacon-related Information/Resources](#resources)  
[Example Code](#example)  
[@todos](#todos)  
[License](#license)  


<a name="requirements"/>
# Requirements
[Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK) - see their README for installation instructions

> Note: the EstimoteSDK found within the Example may or may not be current.  You should not rely on it being the latest/greatest - rely on the link above instead!


<a name="installation"/>
# Installation
Pretty simple stuff: Copy the ESTCompanion folder into your project - and its ready for use.


<a name="categories"/>
# Categories
<a name="uuidgroup"/>
### ESTBeaconManager+UUIDGroup
This is a small category to just make setting up the ESTBeaconManager easier for when we want to start ranging for estimote beacons.

> Checkout the Example for a very simple usage example

So what's so special about this?
* No need for the ESTBeaconRegion property ( see details in sibling points below )
* No need to create an instance of the ESTBeaconRegion
* Optionally Start Ranging Starts Immediately (rather than manually yourself)
* When getting an instance of the ESTBeaconManager, we can also (optionally) set ourselves as the delegate, and also turn on some properties immediately without having to issue calls for each of them

All of the above is achieved with 1 init call, and a single delegate method ( which is not going to even be necessary soon enough ).

##### More Information
There are (quite a few) initialization points available for this guy too by means of `NS_OPTIONS`/`NS_ENUM` to keep things simple and yet expressive.

Checkout `ESTBeaconManager+UUIDGroup.h` for more.

<a name="beaconstore"/>
### ESTBeaconManager+BeaconStore
This category is simply a way to persist iBeacons found/altered during ranging to the `NSUserDefaults`.  The catch 22 to this is that the [Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK) already allows you to save that information to the actual iBeacons - which is not what this is attempting to solve/duplicate ( unless you actually want to that is... ).  This is just a easy way to store more information about them.

*This is just a generic first attempt at it - will refactor/expand on this as the use cases arise.  The hope is to allow support to multiple stores ( `NSUserDefaults`, `Core Data`, remote, etc. ).*

This Category is influenced by the [iBeacon Article on Ray Wenderlich's site](http://www.raywenderlich.com/66584/ios7-ibeacons-tutorial).

##### More Information
Checkout `ESTBeaconManager+BeaconStore.h` for more.


<a name="resources"/>
# iBeacon-related Information/Resources
Here is a small compilation of good resources, information and repositories relating to iBeacons.

* [Estimote IOS-SDK](https://github.com/Estimote/iOS-SDK) - github repo
* [BEEKN](http://beekn.net) - Amazing site with all *kinds* of information relating to iBeacons
* [Developing iOS 7 Applications with iBeacons Tutorial](http://www.raywenderlich.com/66584/ios7-ibeacons-tutorial) - Ray Wenderlich
* [iBeacons Tutorial for iOS 7 with CLBeaconRegion and CLBeacon](http://www.devfright.com/ibeacons-tutorial-ios-7-clbeaconregion-clbeacon/) - DEVFRIGHT
* [A Closer Look at the CLLocationManagerDelegate](http://www.devfright.com/a-closer-look-at-the-cllocationmanagerdelegate/) - DEVFRIGHT
* [EstimoteEditor](https://github.com/ygini/EstimoteEditor) - github repo
* [HiBeacons](https://github.com/nicktoumpelis/HiBeacons) - github repo


<a name="example"/>
# Example Code
The included example is nothing special.  It is just a basic example showing how to use some of the features available.  Currently, it only shows how ot use the `GroupUUID` category.

Here is a screenshot for the curious:

![ScreenShot 1](/example_ss.png)


**Note** The Example shows Major of 1, and Minors of 1,2,3.  This is not a mistake - I actually applied those minors to my beacons while messing around with their SDK.


<a name="todos"/>
# @todo's
* Simplify checking for updates
  * May actually add an option to check for an update every `x` days, or on `z` day of the week.
* Update Example to show how to use the `BeaconStore` category
* Ability to define 3 beacons to work as triangulation points
* Simplify managing the UUID/Minor/Major values
* Ability to change the "color" of a beacon ( 2 of mine were always showing up as teal - I'll update with my fix for this)
* Replace the GroupUUIDDelegate with a block (or just add it as an option)
* Add block support to some other things
* Add background routines for doing some work ( like updates and whatever ) with a single line.
* etc. etc.  that's enough as to not overwhelm myself for now.


<a name="license"/>
# License
See `LICENSE` included with this repo.  Long story short - I'm a dev, you're a dev - we all make great stuff that works, but we also make shitty stuff that breaks...

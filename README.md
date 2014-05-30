ESTCompanion
============

(WIP) - Finding there are some boiler plate setup stuff for working with [Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK).  To make life easier, created some ways to avoid all the boiler plate setup.

** *NOTE* You will find a version of the EstimoteSDK in both the Companion and the Example folders.  It will eventually be moved to the parent folder.  The main thing to remember is that this is only for development purposes.  Do not depend on this having the latest/greatest version of their SDK.  You should do that on your own, which you can find [here](https://github.com/Estimote/iOS-SDK).**

## Table of Contents
[Requirements](#requirements)  
[Installation](#installation)  
[Categories](#categories)  
* [ESTBeaconManager+UUIDGroup](#uuidgroup)
* [ESTBeaconManager+AutoRegioning](#autoregion)
* [ESTBeaconManager+BeaconStore](#beaconstore)
[Classes](#classes)  
* [ESTCompanion](#estcompanion)
* [ESTCompanionConstants](#constants)
[iBeacon-related Information/Resources](#resources)  
[Example Code](#example)  
[@todos](#todos)  
[License](#license)  


<a name="requirements"/>
# Requirements
[Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK) - see their README for installation instructions

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
* Optionally Start Ranging Immediately as you init the ESTBeaconManager
* Optionally set ourselves as the delegate, and also turn on some common properties during init ('NS_OPTIONS') while we are at it
* etc.

All of the above is achieved with 1 init call, and a single delegate method.  As to not turn this into a Billy Mays infomercial here i'll admit the downside is that there isnt much else yet either.  Its a work in progress though and should grow pretty quickly from here on out. 


##### More Information
There are (quite a few) initialization points available for this guy too by means of `NS_OPTIONS`/`NS_ENUM` to keep things simple and yet expressive.

Checkout `Categories/ESTBeaconManager+UUIDGroup.h` for more.

<a name="autoregion"/>
### ESTBeaconManager+AutoRegioning
Category to allow setting up AutoRegioning that much easier.

> Checkout the Example for a very simple usage example

##### More Information
There are (quite a few) initialization points available for this guy too by means of `NS_OPTIONS`/`NS_ENUM` to keep things simple and yet expressive.

Checkout `Categories/ESTBeaconManager+AutoRegioning.h` for more.

<a name="beaconstore"/>
### ESTBeaconManager+BeaconStore
This category is simply a way to persist iBeacons found/altered during ranging to the `NSUserDefaults`.  The catch 22 to this is that the [Estimote's iOS SDK](https://github.com/Estimote/iOS-SDK) already allows you to save that information to the actual iBeacons - which is not what this is attempting to solve/duplicate ( unless you actually want to that is... ).  This is just a easy way to store more information about them.

*This is just a generic first attempt at it - will refactor/expand on this as the use cases arise.  The hope is to allow support to multiple stores ( `NSUserDefaults`, `Core Data`, remote, etc. ).*

This Category is influenced by the [iBeacon Article on Ray Wenderlich's site](http://www.raywenderlich.com/66584/ios7-ibeacons-tutorial).

##### More Information
Checkout `Categories/ESTBeaconManager+BeaconStore.h` for more.


<a name="classes"/>
# Classes
<a name="estcompanion"/>
### ESTCompanion
Simple Object at this point.  There are bigger plans for it, but for now,  has a easy to use way of obtaining the string value from a CLProximity =P

`NSString *proximity = [ESTCompanion sharedInstance] stringFromProximity:beacon.proximity];`

##### More Information
Checkout `Classes/ESTCompanion.h` for more.


<a name="constants"/>
### ESTCompanionConstants
Currently holds just a few constants for dealing with User Defaults, logging, and creating string constants.. 

##### More Information
Checkout `Classes/ESTCompanionConstants.h` for more.


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

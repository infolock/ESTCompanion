//
//  ESTBeaconManager+UUIDGroup.h
//  ESTCompanion
//
//  Created by Jonathon Hibbard on 5/23/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

// WIP!

#import "ESTBeaconManager.h"

/**
 * The callee must be this type of delegate if they wish to use the Start Ranging Immediately init option...
 */
@protocol ESTBeaconManagerUUIDGroupDelegate <ESTBeaconManagerDelegate>

@optional
-(NSArray *)ESTBeaconManagerDelegateShouldReturnUUIDIdentifierArray;
@end

/**
 * Specify how any ranged beacons should be grouped in the array.  The default, kUUIDGroupByNone, just returns the array
 * how Estimote does already...
 */
typedef NS_ENUM(NSInteger, kUUIDGroupBy) {
    kUUIDGroupByNone = 0,        // Default ( 2D array containing only beacons with a specific UUID )
    kUUIDGroupByMajor = 1,       // Group all by the MAJOR value
    kUUIDGroupByCLProximity = 2  // Group all by CLProximity ( keys will be: immediate, near, far, unknown )
};

/**
 * Specify the order by which ranged beacons will appear in the array
 */
typedef NS_ENUM(NSUInteger, kUUIDGroupSortBy) {
    kUUIDGroupSortByDefault = 0,      // Default ( Sort by Proximity )
    kUUIDGroupSortByCLProximity = 0,  // Sort by Proximity ( Default )
    kUUIDGroupSortByMajorMinor = 1    // Sort by Major Value with the Minor Value being used for siblings having the same Major value
};

/**
 * Options to
 */
typedef NS_OPTIONS(NSUInteger, kUUIDGroupInitOptions) {
    kUUIDGroupInitOptionsNone = 0,
    kUUIDGroupInitOptionsAvoidUnknownStateBeacons = 1 << 0,
    kUUIDGroupInitOptionsStartRangingImmediately = 1 << 1   // NOTE: The callee must be a ESTBeaconManagerUUIDGroupDelegate in order to use this!
};


@interface ESTBeaconManager ( UUIDGroup )

/**
 * Initialize without any initOptions
 */
-(instancetype)initWithDelegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy sortBy:(kUUIDGroupSortBy)sortBy;
// Companions
-(instancetype)initWithDelegate:(id <ESTBeaconManagerDelegate>)delegate;
-(instancetype)initWithDelegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy;
-(instancetype)initWithDelegate:(id <ESTBeaconManagerDelegate>)delegate sortBy:(kUUIDGroupSortBy)sortBy;


/**
 * Initialize and start up some boiler plate stuff for free...
 *
 * @param kUUIDGroupInitOptions        initOptions  ( required )
 * @param id<ESTBeaconManagerDelegate> delegate     ( optional - nil by default )
 * @param kUUIDGroupBy                 groupBy      ( required )
 * @param kUUIDGroupSortBy             sortBy       ( required )
 */
-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy sortBy:(kUUIDGroupSortBy)sortBy;
// Companions
-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate;
-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy;
-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate sortBy:(kUUIDGroupSortBy)sortBy;

-(void)stopRangingBeaconsInRegion;

@end

//
//  ESTBeaconManager+AutoRegioning.m
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 estcompanion. All rights reserved.
//

#import "ESTBeaconManager+AutoRegioning.h"

@implementation ESTBeaconManager (AutoRegioning)

-(instancetype)initAutoRegioningWithDelegate:(id <ESTBeaconManagerDelegate>)delegate proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier {
    return [self initAutoRegioningWithOptions:kUUIDGroupInitOptionsNone delegate:delegate groupBy:kUUIDGroupByNone sortBy:kUUIDGroupSortByCLProximity proximityUUID:proximityUUID identifier:identifier];
}

-(instancetype)initAutoRegioningWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier {
    return [self initAutoRegioningWithOptions:kUUIDGroupInitOptionsNone delegate:delegate groupBy:kUUIDGroupByNone sortBy:kUUIDGroupSortByCLProximity proximityUUID:proximityUUID identifier:identifier];
}

-(instancetype)initAutoRegioningWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy sortBy:(kUUIDGroupSortBy)sortBy proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier {

    // Ensure we aren't passing in the startRangingImmediately here as this category will take care of it instead...
    initOptions &= ~kUUIDGroupInitOptionsStartRangingImmediately;

    ESTBeaconManager *beaconManager = [self initWithOptions:initOptions delegate:delegate groupBy:groupBy sortBy:sortBy];
    if( beaconManager ) {
        [self startRangingImmediatelyWithProximityUUID:proximityUUID identifier:identifier];
    }

    return beaconManager;
}

-(void)startRangingImmediatelyWithProximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier {

    ESTBeaconRegion *region = [[ESTBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier: identifier];
    [self setAssociatedRegion:region];

    [self startRangingBeaconsInRegion:region];

    NSLog(@"Ranging Started Immediately");
}

@end

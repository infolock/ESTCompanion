//
//  ESTBeaconManager+AutoRegioning.m
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "ESTBeaconManager+AutoRegioning.h"

@implementation ESTBeaconManager (AutoRegioning)

-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy sortBy:(kUUIDGroupSortBy)sortBy proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier {

    // Ensure we aren't passing in the startRangingImmediately here as this category will take care of it instead...
    initOptions &= ~kUUIDGroupInitOptionsStartRangingImmediately;

    ESTBeaconManager *beaconManager = [self initWithOptions:initOptions
                                                   delegate:delegate
                                                    groupBy:groupBy
                                                     sortBy:sortBy];

    [self startRangingImmediatelyWithProximityUUID:proximityUUID
                                        identifier:identifier];

    return beaconManager;
}

-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier {
    return [self initWithOptions:kUUIDGroupInitOptionsNone delegate:delegate groupBy:kUUIDGroupByNone sortBy:kUUIDGroupSortByCLProximity proximityUUID:proximityUUID identifier:identifier];
}

-(instancetype)initWithDelegate:(id <ESTBeaconManagerDelegate>)delegate proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier {
    return [self initWithOptions:kUUIDGroupInitOptionsNone delegate:delegate groupBy:kUUIDGroupByNone sortBy:kUUIDGroupSortByCLProximity proximityUUID:proximityUUID identifier:identifier];
}

-(void)startRangingImmediatelyWithProximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier {

    ESTBeaconRegion *region = [[ESTBeaconRegion alloc] initWithProximityUUID:proximityUUID
                                                                  identifier:identifier];

    [self setAssociatedRegion:region];
    [self startRangingBeaconsInRegion:region];

    NSLog(@"Ranging Started Immediately");
}

@end

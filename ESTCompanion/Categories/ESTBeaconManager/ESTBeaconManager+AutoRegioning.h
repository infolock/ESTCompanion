//
//  ESTBeaconManager+AutoRegioning.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "ESTBeaconManager+UUIDGroup.h"

/**
 * When this Category is included, initWithOptions will, by default, force kUUIDGroupInitOptionsStartRangingImmediately to be used.
 * Think of it as a lazy dev's way of getting kUUIDGroupInitOptionsStartRangingImmediately without having to explicitly say it...
 */

@interface ESTBeaconManager (AutoRegioning)

/**
 * @see ESTBeaconManager+UUIDGroup.h for full breakdown of params and description.
 */
-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy sortBy:(kUUIDGroupSortBy)sortBy proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier;
-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier;
-(instancetype)initWithDelegate:(id <ESTBeaconManagerDelegate>)delegate proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier;

@end

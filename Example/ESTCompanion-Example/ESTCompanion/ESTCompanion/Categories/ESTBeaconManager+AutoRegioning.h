//
//  ESTBeaconManager+AutoRegioning.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "ESTBeaconManager+UUIDGroup.h"

@interface ESTBeaconManager (AutoRegioning)

-(instancetype)initAutoRegioningWithDelegate:(id <ESTBeaconManagerDelegate>)delegate proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier;
-(instancetype)initAutoRegioningWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier;
-(instancetype)initAutoRegioningWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy sortBy:(kUUIDGroupSortBy)sortBy proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier;

@end

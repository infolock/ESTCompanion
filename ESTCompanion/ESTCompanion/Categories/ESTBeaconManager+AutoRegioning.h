//
//  ESTBeaconManager+AutoRegioning.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 estcompanion. All rights reserved.
//

#import "ESTBeaconManager+UUIDGroup.h"

@interface ESTBeaconManager (AutoRegioning)

-(instancetype)initWithAutoRegioningWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy sortBy:(kUUIDGroupSortBy)sortBy proximityUUID:(NSUUID *)proximityUUID identifier:(NSString *)identifier;

@end

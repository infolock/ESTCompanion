//
//  ESTBeacon+Companion.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/30/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "ESTBeacon.h"

@interface ESTBeacon (Companion)

/**
 * Define the "color" of the Estimote beacon's outter shell
 */
-(UIColor *)beaconColor;

/**
 * This is the same identifier used when initializing a beacon.  In the new Estimote iOS SDK, this is synonymous with "name"
 */
-(NSString *)identifier;

-(void)setBeaconColor:(UIColor *)beaconColor;
-(void)setIdentifier:(NSString *)identifier;

/**
 * Persist all changes made to the ESTBeacon to NSUserDefaults.
 */
-(void)syncChangesToStore;

//-(NSString *)storeKeyName;
//-(void)syncChangesToStore;

@end

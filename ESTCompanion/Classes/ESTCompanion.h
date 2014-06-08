//
//  ESTCompanion.h
//  ESTCompanion
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

@import Foundation;

#import "ESTBeaconDefinitions.h"

@class ESTBeacon;

@interface ESTCompanion : NSObject

+(instancetype)sharedInstance;

-(NSString *)stringFromProximity:(NSInteger)proximity;

/**
 * >>> WARNING <<<
 * Running resetFactorySettingsToBeacon will - well, reset your beacon's Settings ( ProximityUUID, Minor, Major, etc. ) to
 * the Factory Setting Defaults.  It should be treated like a rock - it has no eyes, heart or soul, so only use it if you mean to.
 *
 *
 * >>> NOTE <<<
 * If another Controller is set as the ESTBeaconDelegate, then it would be wise to use resetFactorySettingsToBeacon:withCompletion: instead.
 * In the completion block, it will be necessary to reset the object that is desired to be ESTBeaconDelegate to the delegate.
 * The reason is because ESTCompanion will make itself the delegate to handle the connection crap - but once it is complete, it will
 * reset the delegate to nil.  The completion block is therefore the prime opportunity to reset the delegate to another object.
 *
 */
-(void)resetFactorySettingsToBeacon:(ESTBeacon *)beacon;
-(void)resetFactorySettingsToBeacon:(ESTBeacon *)beacon withCompletion:(ESTCompletionBlock)block;

@end

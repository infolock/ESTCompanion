//
//  ESTBeaconManager+BeaconStore.m
//  estimoteTraining
//
//  Created by Jonathon Hibbard on 5/24/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "ESTBeaconManager+BeaconStore.h"

@implementation ESTBeaconManager (BeaconStore)


#pragma mark -
#pragma mark Private Method(s)
#pragma mark -

+(NSString *)stringForBeaconStoreInfoKey:(kBeaconStoreInfo)key {
    static NSString *defaultKeyName = @"ESTBeacons";

    switch( key ) {
        case kBeaconStoreInfoDefaultKeyName: return defaultKeyName;
        default: return nil;
    }
}


#pragma mark -
#pragma mark Public Methods
#pragma mark -

#pragma mark - Methods using kBeaconStoreTypes

+(void)storeBeaconsInArray:(NSArray *)beacons storeTypes:(kBeaconStoreTypes)storageTypes {
    if( [beacons count] == 0 ) {
        NSLog( @"There are no beacons found in the received array to store.  storeBeaconsInArray returning without saving anything." );
        return;
    }

    if( storageTypes & kBeaconStoreTypeNSUserDefaults ) {
        [[self class] writeToNSUserDefaultsUsingBeacons:beacons];
    }
}

+(void)storeBeaconsInArray:(NSArray *)beacons storeTypes:(kBeaconStoreTypes)storageTypes withStorageKeyName:(NSString *)keyName {

    if( [beacons count] == 0 ) {
        NSLog( @"There are no beacons found in the received array to store.  storeBeaconsInArray returning without saving anything." );
        return;
    }

    if( storageTypes & kBeaconStoreTypeNSUserDefaults ) {
        [[self class] writeToNSUserDefaultsUsingBeacons:beacons withStorageKeyName:keyName];
    }
}

/**
 * @todo Should update this to support appending/merging other storage types to a mutable array and returning the result.
 */
+(NSArray *)retrieveBeaconsFromStorageTypes:(kBeaconStoreTypes)storageType {
    if( storageType & kBeaconStoreTypeNSUserDefaults ) {
        return [[self class] retrieveBeaconsFromNSUserDefaults];
    }

    return nil;
}

+(NSArray *)retrieveBeaconsFromStorageTypes:(kBeaconStoreTypes)storageType usingStorageKeyName:(NSString *)keyName {
    if( storageType & kBeaconStoreTypeNSUserDefaults ) {
        return [[self class] retrieveBeaconsFromNSUserDefaultsUsingKeyWithName:keyName];
    }

    return nil;
}


#pragma mark - NSUserDefaults Storage Methods

/**
 * @todo Perhaps we need a way to specify the location to use as well?
 */
+(void)writeToNSUserDefaultsUsingBeacons:(NSArray *)beacons {

    NSString *storageKey = [[self class] stringForBeaconStoreInfoKey:kBeaconStoreInfoDefaultKeyName];
    [self writeToNSUserDefaultsUsingBeacons:beacons withStorageKeyName:storageKey];
}

+(void)writeToNSUserDefaultsUsingBeacons:(NSArray *)beacons withStorageKeyName:(NSString *)keyName {
    NSMutableArray *storageData = [NSMutableArray array];

    for( ESTBeacon *beacon in beacons ) {
        NSData *beaconInfo = [NSKeyedArchiver archivedDataWithRootObject:beacon];
        [storageData addObject:beaconInfo];
    }

    [[NSUserDefaults standardUserDefaults] setObject:storageData forKey:keyName];

    NSLog( @"Beacons received and stored in NSUserDefaults..." );
}

+(NSArray *)retrieveBeaconsFromNSUserDefaults {
    NSString *storageKey = [[self class] stringForBeaconStoreInfoKey:kBeaconStoreInfoDefaultKeyName];
    return [[self class] retrieveBeaconsFromNSUserDefaultsUsingKeyWithName:storageKey];
}

+(NSArray *)retrieveBeaconsFromNSUserDefaultsUsingKeyWithName:(NSString *)keyName {
    NSArray *beacons = [[NSUserDefaults standardUserDefaults] arrayForKey:keyName];
    return beacons;
}

@end

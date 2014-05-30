//
//  ESTCompanion+BeaconStore.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/30/14.
//  Copyright (c) 2014 estcompanion. All rights reserved.
//

#import "ESTCompanion.h"

typedef NS_ENUM( NSUInteger, kBeaconStoreInfo ) {
    kBeaconStoreInfoDefaultKeyName
};

/**
 * Used to specify which storage type(s) to use for saving beacon information.
 * This can be expanded upon to include whatever (Core Data, Remote Services, etc. )...
 */
typedef NS_OPTIONS(NSUInteger, kBeaconStores) {
    kBeaconStoresDefault = 1 << 0    // NSUserDefaults
};


@class ESTBeacon;

@interface ESTCompanion (BeaconStore)

// Single Beacon Storage/Retrieval
+(ESTBeacon *)obtainBeaconFromStoreTypes:(kBeaconStores)storageTypes havingKeyName:(NSString *)keyName;
+(ESTBeacon *)obtainBeaconFromUserDefaultsWithKeyName:(NSString *)keyName;

+(void)saveBeacon:(ESTBeacon *)beacon toStores:(kBeaconStores)storageTypes usingKeyName:(NSString *)keyName;
+(void)saveToUserDefaultsUsingBeacon:(ESTBeacon *)beacon keyName:(NSString *)keyName;


// Multiple Beacons Storage/Retrieval

+(void)saveBeaconsInArray:(NSArray *)beacons usingStoreTypes:(kBeaconStores)storageTypes withKeyName:(NSString *)keyName;
+(void)saveBeaconsInArray:(NSArray *)beacons usingStoreTypes:(kBeaconStores)storageTypes;

+(void)saveToDefaultsUsingBeacons:(NSArray *)beacons withStorageKeyName:(NSString *)keyName;
+(void)saveToDefaultsUsingBeacons:(NSArray *)beacons;

+(NSArray *)obtainBeaconsFromStoreTypes:(kBeaconStores)storageType usingStorageKeyName:(NSString *)keyName;
+(NSArray *)obtainBeaconsFromStoreTypes:(kBeaconStores)storageType;

+(NSArray *)obtainBeaconsFromDefaultsWithKeyName:(NSString *)keyName;
+(NSArray *)obtainBeaconsFromDefaults;

@end

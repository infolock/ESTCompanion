//
//  ESTBeaconManager+BeaconStore.h
//  estimoteTraining
//
//  Created by Jonathon Hibbard on 5/24/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "ESTBeaconManager.h"

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


@interface ESTBeaconManager (BeaconStore)

+(void)saveBeaconsInArray:(NSArray *)beacons usingStoreTypes:(kBeaconStores)storageTypes withKeyName:(NSString *)keyName;
+(void)saveBeaconsInArray:(NSArray *)beacons usingStoreTypes:(kBeaconStores)storageTypes;

+(void)saveToDefaultsUsingBeacons:(NSArray *)beacons withStorageKeyName:(NSString *)keyName;
+(void)saveToDefaultsUsingBeacons:(NSArray *)beacons;

+(NSArray *)obtainBeaconsFromStoreTypes:(kBeaconStores)storageType usingStorageKeyName:(NSString *)keyName;
+(NSArray *)obtainBeaconsFromStoreTypes:(kBeaconStores)storageType;

+(NSArray *)obtainBeaconsFromDefaultsWithKeyName:(NSString *)keyName;
+(NSArray *)obtainBeaconsFromDefaults;

@end

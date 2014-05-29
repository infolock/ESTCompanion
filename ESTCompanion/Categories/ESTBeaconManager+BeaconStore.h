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
typedef NS_OPTIONS(NSUInteger, kBeaconStoreTypes) {
    kBeaconStoreTypeNSUserDefaults = 1 << 0
};


@interface ESTBeaconManager (BeaconStore)

+(void)storeBeaconsInArray:(NSArray *)beacons storeTypes:(kBeaconStoreTypes)storageTypes;
+(void)storeBeaconsInArray:(NSArray *)beacons storeTypes:(kBeaconStoreTypes)storageTypes withStorageKeyName:(NSString *)keyName;

+(NSArray *)retrieveBeaconsFromStorageTypes:(kBeaconStoreTypes)storageType;
+(NSArray *)retrieveBeaconsFromStorageTypes:(kBeaconStoreTypes)storageType usingStorageKeyName:(NSString *)keyName;


+(void)writeToNSUserDefaultsUsingBeacons:(NSArray *)beacons;
+(void)writeToNSUserDefaultsUsingBeacons:(NSArray *)beacons withStorageKeyName:(NSString *)keyName;

+ (NSArray *)retrieveBeaconsFromNSUserDefaults;
+ (NSArray *)retrieveBeaconsFromNSUserDefaultsUsingKeyWithName:(NSString *)keyName;
@end

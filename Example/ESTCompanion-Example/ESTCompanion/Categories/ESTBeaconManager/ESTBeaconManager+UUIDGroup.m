//
//  ESTBeaconManager+UUIDGroup.m
//  ESTCompanion
//
//  Created by Jonathon Hibbard on 5/23/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

// WIP!

#import <objc/runtime.h>
#import "ESTBeaconManager+UUIDGroup.h"

static char kAssociatedRegionKey;

@implementation ESTBeaconManager ( UUIDGroup )


#pragma mark -
#pragma mark Instance Methods
#pragma mark -


-(instancetype)initWithDelegate:(id <ESTBeaconManagerDelegate>)delegate {
    return [self initWithOptions:kUUIDGroupInitOptionsNone delegate:delegate groupBy:kUUIDGroupByNone sortBy:kUUIDGroupSortByDefault];
}

-(instancetype)initWithDelegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy {
    return [self initWithOptions:kUUIDGroupInitOptionsNone delegate:delegate groupBy:groupBy sortBy:kUUIDGroupSortByDefault];
}

-(instancetype)initWithDelegate:(id <ESTBeaconManagerDelegate>)delegate sortBy:(kUUIDGroupSortBy)sortBy {
    return [self initWithOptions:kUUIDGroupInitOptionsNone delegate:delegate groupBy:kUUIDGroupByNone sortBy:sortBy];
}

-(instancetype)initWithDelegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy sortBy:(kUUIDGroupSortBy)sortBy {
    return [self initWithOptions:kUUIDGroupInitOptionsNone delegate:delegate groupBy:groupBy sortBy:sortBy];
}

-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate {
    return [self initWithOptions:initOptions delegate:delegate groupBy:kUUIDGroupByNone sortBy:kUUIDGroupSortByDefault];
}

-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy {
    return [self initWithOptions:initOptions delegate:delegate groupBy:groupBy sortBy:kUUIDGroupSortByDefault];
}

-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate sortBy:(kUUIDGroupSortBy)sortBy {
    return [self initWithOptions:initOptions delegate:delegate groupBy:kUUIDGroupByNone sortBy:sortBy];
}

-(instancetype)initWithOptions:(kUUIDGroupInitOptions)initOptions delegate:(id <ESTBeaconManagerDelegate>)delegate groupBy:(kUUIDGroupBy)groupBy sortBy:(kUUIDGroupSortBy)sortBy {

    self = [self init];

    if( self ) {
        self.delegate = delegate;
        [self processInitOptions:initOptions];
    }

    return self;
}


#pragma mark - Process Init Options ( kUUIDGroupInitOptions NS_OPTIONS )

-(void)processInitOptions:(kUUIDGroupInitOptions)initOptions {

    if( initOptions & kUUIDGroupInitOptionsNone ) {
        return;
    }

    self.avoidUnknownStateBeacons = !!( initOptions & kUUIDGroupInitOptionsAvoidUnknownStateBeacons );

    if( initOptions & kUUIDGroupInitOptionsStartRangingImmediately ) {
        [self startRangingImmediately];
    }
}


#pragma mark -
#pragma mark StartRangingImmediately Methods
#pragma mark -

-(void)startRangingImmediately {

    // Make sure that we have everything we need in order to make this work!!
    if( ![self.delegate respondsToSelector:@selector( ESTBeaconManagerDelegateShouldReturnUUIDIdentifierArray ) ] ) {

        NSLog(@"Delegate did not implement ESTBeaconManagerDelegateShouldReturnUUIDIdentifierArray - Can't Start Ranging Immediately");
        return;
    }

    NSArray *uuidIdentifierArray = [self.delegate performSelector:@selector(ESTBeaconManagerDelegateShouldReturnUUIDIdentifierArray)];
    if( ![self isValidUUIDIdentifierArray:uuidIdentifierArray] ) {
        NSLog(@"Delegate did not return an array with [NSUUID, STRING] - Can't Start Ranging Immediately");
        return;
    }

    NSString *identifier = [uuidIdentifierArray[1] copy];
    ESTBeaconRegion *region = [[ESTBeaconRegion alloc] initWithProximityUUID:uuidIdentifierArray[0] identifier: identifier];
    [self setAssociatedRegion:region];

    [self startRangingBeaconsInRegion:[self associatedRegion]];

    NSLog(@"Ranging Started Immediately");
}

-(BOOL)isValidUUIDIdentifierArray:(NSArray *)uuidIdentifierArray {
    return uuidIdentifierArray && [uuidIdentifierArray count] == 2 && [uuidIdentifierArray[0] isKindOfClass:[NSUUID class]] && [uuidIdentifierArray[1] isKindOfClass:[NSString class]];
}

-(void)stopRangingBeaconsInRegion {

    ESTBeaconRegion *region = [self associatedRegion];
    if( region ) {
        [self stopRangingBeaconsInRegion:region];
        [self setAssociatedRegion:nil];
    }
}

#pragma mark - Yuck...

/**
 * I'm not a fan of associated objects ( note to self: write a drunken rant about it another day ).  Anyways.
 *
 * @todo Clearly, we need to just create a NSObject or another Category somewhere to be the entry point to this Category...For now, this will have to do...
 */
-(void)setAssociatedRegion:(ESTBeaconRegion *)associatedRegion {
    objc_setAssociatedObject( self, &kAssociatedRegionKey, associatedRegion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(ESTBeaconRegion *)associatedRegion {
    return objc_getAssociatedObject( self, &kAssociatedRegionKey);
}

@end

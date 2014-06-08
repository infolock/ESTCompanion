//
//  ESTBeacon+Companion.m
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/30/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import <objc/runtime.h>

#import "ESTBeacon+Companion.h"
#import "UIColor+Hexcode.h"
#import "ESTCompanion+BeaconStore.h"
#import "ESTCompanionConstants.h"

static char kAssociatedColorKey;
static char kAssociatedIdentifierKey;

@implementation ESTBeacon (Companion)

#pragma mark -
#pragma mark Getters
#pragma mark -

#pragma mark Color
-(UIColor *)beaconColor {

    UIColor *color = [self associatedColor];
    if( !color ) {

        NSString *identifier = [self identifier];
        NSDictionary *beaconInfo = [ESTCompanion obtainBeaconInfoFromStoreTypes:kBeaconStoresDefault havingKeyName:identifier];

        BOOL shouldSync = NO;

        if( !beaconInfo || !beaconInfo[@"color"] ) {
            color = [UIColor blackColor];
            shouldSync = YES;
        } else {
            color = beaconInfo[@"color"];
        }

        [self setAssociatedColor:color];

        if( shouldSync ) {
            [self syncChangesToStore];
        }
    }

    return color;
}

#pragma mark Identifier
-(NSString *)identifier {

    NSString *identifier = [self associatedIdentifier];
    if( !identifier ) {

        identifier = [NSString stringWithFormat:@"%@:%i:%i", DEFAULT_COMPANION_IDENTIFIER, [self.major intValue], [self.minor intValue]];

        [self setAssociatedIdentifier:identifier];
    }

    return identifier;
}


#pragma mark -
#pragma mark - Setters
#pragma mark -

#pragma mark Color
-(void)setBeaconColor:(UIColor *)beaconColor {
    [self setAssociatedColor:beaconColor];
}

-(void)setIdentifier:(NSString *)identifier {
    [self setAssociatedIdentifier:identifier];
}

#pragma mark -
#pragma mark Methods
#pragma mark -

-(void)syncChangesToStore {

    UIColor *color = [self beaconColor];
    NSString *identifier = [self identifier];
    NSLog( @"identifier = %@ ", identifier );

    NSDictionary *beaconInfo = @{
                                 @"color": color,
                                 @"identifier": [identifier copy]
                                };

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [ESTCompanion saveBeaconInfo:beaconInfo toStores:kBeaconStoresDefault usingKeyName:identifier];
        SYNC_DEFAULTS;
    });
}


#pragma mark -
#pragma mark Associated Properties (PRIVATE)
#pragma mark -

#pragma mark Color
-(void)setAssociatedColor:(UIColor *)companionColor {
    objc_setAssociatedObject( self, &kAssociatedColorKey, companionColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
}

-(UIColor *)associatedColor {
    return objc_getAssociatedObject( self, &kAssociatedColorKey);
}

#pragma mark Identifier
-(void)setAssociatedIdentifier:(NSString *)companionIdentifier {
    objc_setAssociatedObject( self, &kAssociatedIdentifierKey, [companionIdentifier copy], OBJC_ASSOCIATION_COPY );
}

-(NSString *)associatedIdentifier {
    return objc_getAssociatedObject( self, &kAssociatedIdentifierKey);
}

@end

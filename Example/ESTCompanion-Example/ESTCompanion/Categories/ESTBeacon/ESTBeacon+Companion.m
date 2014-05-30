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
-(UIColor *)color {
    [self validateProperties];
    
    return [self associatedColor];
}

#pragma mark Identifier
-(NSString *)identifier {

    NSString *identifier = [self associatedIdentifier];
    if( !identifier ) {

        NSString *hexcode = [self.color hexCodeColor];
        NSLog( @"Hex = %@ ", hexcode );
        
        identifier = [NSString stringWithFormat:@"%@:%i:%i:%@", DEFAULT_COMPANION_IDENTIFIER, [self.major intValue], [self.minor intValue], hexcode];
        [self setAssociatedIdentifier:identifier];
    }

    return identifier;
}


#pragma mark -
#pragma mark - Setters
#pragma mark -

#pragma mark Color
-(void)setColor:(UIColor *)color {
    [self setAssociatedColor:color];
}


#pragma mark -
#pragma mark Methods
#pragma mark -

-(void)validateProperties {

    UIColor *color = [self associatedColor];
    if( !color ) {
        UIColor *companionColor = [UIColor blackColor];
        [self setAssociatedColor:companionColor];
    }
}


//-(void)syncChangesToStore {
//    
//    [self validateProperties];
//    
//    NSString *storeKeyName = [self storeKeyName];
//    NSLog( @"StoreKeyName = %@ ", storeKeyName );
//    
//    [ESTBeaconManager saveBeaconsInArray:@[self] usingStoreTypes:kBeaconStoresDefault withKeyName:storeKeyName];
//    SYNC_DEFAULTS;
//}


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

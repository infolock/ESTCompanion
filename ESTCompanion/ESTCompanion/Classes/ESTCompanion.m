//
//  ESTCompanion.m
//  ESTCompanion
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "ESTCompanion.h"

@interface ESTCompanion()
@property (nonatomic, copy) NSArray *proximityStrings;
@end

@implementation ESTCompanion

+(instancetype)sharedInstance {
    static ESTCompanion *_sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _sharedInstance = [ESTCompanion new];
    });

    return _sharedInstance;
}

-(instancetype)init {

    self = [super init];
    if( self ) {
        self.proximityStrings = @[ @"Unknown", @"Immediate", @"Near", @"Far" ];
    }

    return self;
}

-(void)setProximityStrings:(NSArray *)proximityStrings {
    _proximityStrings = [proximityStrings copy];
}

// Get the string representation of a given CLProximity
-(NSString *)stringFromProximity:(NSInteger)proximity {
    return self.proximityStrings[(NSUInteger)proximity];
}

@end

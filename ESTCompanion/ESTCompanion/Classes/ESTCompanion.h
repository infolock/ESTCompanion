//
//  ESTCompanion.h
//  ESTCompanion
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

@import Foundation;

#import "ESTCompanionConstants.h"

@interface ESTCompanion : NSObject

+(instancetype)sharedInstance;

-(NSString *)stringFromProximity:(NSInteger)proximity;

@end

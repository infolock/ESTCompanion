//
//  ESTBeacon+Companion.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/30/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "ESTBeacon.h"

@interface ESTBeacon (Companion)

-(UIColor *)color;
-(NSString *)identifier;

-(void)setColor:(UIColor *)color;
-(void)setIdentifier:(NSString *)identifier;

-(void)syncChangesToStore;

//-(NSString *)storeKeyName;
//-(void)syncChangesToStore;

@end

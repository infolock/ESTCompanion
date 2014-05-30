//
//  NSUUID+Utils.m
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/30/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "NSUUID+Utils.h"

@implementation NSUUID (Utils)

+(NSString *)generateUUID {
    return [[NSUUID UUID] UUIDString];
}


+(NSUUID *)proximityUUIDFromUUID:(id)UUID {
    
    if( [UUID isKindOfClass:[NSString class]] ) {
        return [[NSUUID alloc] initWithUUIDString:UUID];
    }
    
    return UUID;
}

+(BOOL)isValidProximityUUID:(NSString *)proximityUUID {
    return (bool)[[NSUUID alloc] initWithUUIDString:proximityUUID];
}

/*
+(NSString *)stripHyphensFromString:(NSString *)string atCursorPosition:(NSUInteger *)cursorPosition {
    
    NSUInteger originalCursorPosition = *cursorPosition;
    NSMutableString *poleDancer = [NSMutableString new];
    
    NSUInteger strLen = [string length];
    NSUInteger i;
    
    for( i = 0; i < strLen; i++ ) {
        unichar characterToAdd = [string characterAtIndex:i];
        
        if( isalnum( characterToAdd ) ) {
            
            NSString *stringToAdd = [NSString stringWithCharacters:&characterToAdd length:1];
            [poleDancer appendString:stringToAdd];
            
        } else if( i < originalCursorPosition ) {
            (*cursorPosition)--;
        }
    }
    
    return poleDancer;
}

+(NSString *)hyphenateString:(NSString *)string atCursorPosition:(NSUInteger *)cursorPosition {
    
    NSMutableString *hyphenatedString = [NSMutableString new];
    NSUInteger cursorPositionInString = *cursorPosition;
    
    NSUInteger strLen = [string length];
    NSUInteger i;
    
    for( i = 0; i < strLen; i++) {
        if( i >= 8 && i <= 20 && i%4 == 0 ) {
            [hyphenatedString appendString:@"-"];
            
            if( i < cursorPositionInString ) {
                (*cursorPosition)++;
            }
        }
        
        unichar characterToAdd = [string characterAtIndex:i];
        [hyphenatedString appendString:[NSString stringWithCharacters:&characterToAdd length:1]];
    }
    
    return hyphenatedString;
}
*/
@end

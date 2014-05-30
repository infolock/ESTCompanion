//
//  NSUUID+Utils.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/30/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

@interface NSUUID (Utils)

/**
 * Some (extra) helpers...
 */

// Quick way to generate a random UUID
+(NSString *)generateUUID;

// Convenience method to allow us to work with either a UUID String or Object
+(NSUUID *)proximityUUIDFromUUID:(id)UUID;

// Is this a valid ProximityUUID?
+(BOOL)isValidProximityUUID:(NSString *)proximityUUID;

// Removes all hyphens from a given ProximityUUID
+(NSString *)stripHyphensFromString:(NSString *)string atCursorPosition:(NSUInteger *)cursorPosition;

// Formats a string to be in a valid ProximityUUID format
+(NSString *)hyphenateString:(NSString *)string atCursorPosition:(NSUInteger *)cursorPosition;

@end

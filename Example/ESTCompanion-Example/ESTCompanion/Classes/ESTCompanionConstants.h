//
//  ESTCompanionConstants.h
//  ESTCompanion
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#ifdef ESTCOMPANIONCONSTANTS
#define EXTERN
#define STR_CONST(name, value) NSString* const name = @ value
#else
#define EXTERN extern
#define STR_CONST(name, value) extern NSString* const name

#endif

/**
 * Original Source: https://gist.github.com/burczyk/6111139
 */

#define DEFAULTS                            [NSUserDefaults standardUserDefaults]
#define DEFAULTS_SET(key, value)            [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]
#define SYNC_DEFAULTS                       [[NSUserDefaults standardUserDefaults] synchronize]

#define DEFAULT_COMPANION_IDENTIFIER           @"estimoteIdentifier"

#define DEBUG_STRING(str)                   [NSString stringWithFormat:@"%s %d %s\n%@", __FILE__, __LINE__, __PRETTY_FUNCTION__, str]

#define isEmptyString(object) ([object length] == 0)
#define trimString(object) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]

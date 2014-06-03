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

#define DEFAULTS                          [NSUserDefaults standardUserDefaults]
#define SYNC_DEFAULTS                     [[NSUserDefaults standardUserDefaults] synchronize]

#define DEFAULTS_SET(key, value)          [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]
#define DEFAULTS_FOR_KEY(key)             [[NSUserDefaults standardUserDefaults] objectForKey:key]

#define DEFAULTS_SET_BOOL(key, value)     [[NSUserDefaults standardUserDefaults] setBool:value forKey:key]
#define DEFAULTS_BOOL_FOR_KEY(key)        [[NSUserDefaults standardUserDefaults] boolForKey:key]

#define DEFAULT_COMPANION_IDENTIFIER           @"estimoteIdentifier"

#define DEBUG_STRING(str)                   [NSString stringWithFormat:@"%s %d %s\n%@", __FILE__, __LINE__, __PRETTY_FUNCTION__, str]

#define isEmptyString(object) ([object length] == 0)
#define trimString(object) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]

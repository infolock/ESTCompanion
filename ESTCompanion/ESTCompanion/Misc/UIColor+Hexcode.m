//
//  UIColor+Hexcode.m
//  ESTCompanion
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "UIColor+Hexcode.h"

@implementation UIColor (Hexcode)

/**
 * This is some code I wrote for an app a buddy of mine and I work on from time to time called eLBee.
 */

+(UIColor *)colorFromHexCode:(NSString *)hexCode {

    float(^intToBaseHexFloat)(unsigned int, NSInteger) = ^(unsigned int baseVal, NSInteger intVal) {
        return ((baseVal >> 24) & 0xFF)/255.0f;
    };

    NSString *(^substringWithRange)(NSString *, NSUInteger, NSUInteger) = ^(NSString * fromString, NSUInteger len, NSUInteger loc) {
        return [fromString substringWithRange:NSMakeRange(len, loc)];
    };

    NSString *cString = [hexCode stringByReplacingOccurrencesOfString:@"#" withString:@""];

    if([cString length] == 3)
        cString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                                             substringWithRange(cString, 0, 1),
                                             substringWithRange(cString, 0, 1),
                                             substringWithRange(cString, 1, 1),
                                             substringWithRange(cString, 1, 1),
                                             substringWithRange(cString, 2, 1),
                                             substringWithRange(cString, 2, 1)];

    if([cString length] == 6) cString = [cString stringByAppendingString:@"ff"];
    unsigned int baseValue;

    [[NSScanner scannerWithString:cString] scanHexInt:&baseValue];
    float red = intToBaseHexFloat(baseValue, 24);
    float green = intToBaseHexFloat(baseValue, 16);
    float blue = intToBaseHexFloat(baseValue, 8);
    float alpha = intToBaseHexFloat(baseValue, 0);

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


/**
 * Original Source for code below: https://github.com/nicklockwood/ColorUtils/blob/master/ColorUtils/ColorUtils.m
 *
 * Note: Made some minor mods... JGH 05/30/2014
 */

//
//  ColorUtils.m
//
//  Version 1.1.2
//
//  Created by Nick Lockwood on 19/11/2011.
//  Copyright (c) 2011 Charcoal Design
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/ColorUtils
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

-(NSString *)hexCodeColor {

    CGFloat alpha = CGColorGetAlpha( self.CGColor );

    if( alpha < 1.0f ) {
        return [NSString stringWithFormat:@"#%.8x", self.RGBAValue];
    }

    //don't include alpha component
    return [NSString stringWithFormat:@"#%.6x", self.RGBValue];
}

-(uint32_t)RGBValue {
    CGFloat rgba[4];

    CGColorSpaceModel model = CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
    const CGFloat *components = CGColorGetComponents(self.CGColor);

    switch(model) {
        case kCGColorSpaceModelMonochrome: {
            rgba[0] = components[0];
            rgba[1] = components[0];
            rgba[2] = components[0];
            rgba[3] = components[1];
        }
        break;

        case kCGColorSpaceModelRGB: {
            rgba[0] = components[0];
            rgba[1] = components[1];
            rgba[2] = components[2];
            rgba[3] = components[3];
        }
        break;

        default: {
            rgba[0] = 0.0f;
            rgba[1] = 0.0f;
            rgba[2] = 0.0f;
            rgba[3] = 1.0f;
        }
        break;
    }

    uint32_t red = (uint32_t)(rgba[0]*255);
    uint32_t green = (uint32_t)(rgba[1]*255);
    uint32_t blue = (uint32_t)(rgba[2]*255);

    return (red << 16) + (green << 8) + blue;
}

-(uint32_t)RGBAValue {
    CGFloat rgba[4];

    CGColorSpaceModel model = CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
    const CGFloat *components = CGColorGetComponents(self.CGColor);

    switch( model ) {
        case kCGColorSpaceModelMonochrome: {
            rgba[0] = components[0];
            rgba[1] = components[0];
            rgba[2] = components[0];
            rgba[3] = components[1];
        }
        break;

        case kCGColorSpaceModelRGB: {
            rgba[0] = components[0];
            rgba[1] = components[1];
            rgba[2] = components[2];
            rgba[3] = components[3];
        }
        break;

        default: {
            rgba[0] = 0.0f;
            rgba[1] = 0.0f;
            rgba[2] = 0.0f;
            rgba[3] = 1.0f;
        }
        break;
    }

    uint8_t red = (uint8_t)(rgba[0]*255);
    uint8_t green = (uint8_t)(rgba[1]*255);
    uint8_t blue = (uint8_t)(rgba[2]*255);
    uint8_t alpha = (uint8_t)(rgba[3]*255);

    return (red << 24) + (green << 16) + (blue << 8) + alpha;
}

@end

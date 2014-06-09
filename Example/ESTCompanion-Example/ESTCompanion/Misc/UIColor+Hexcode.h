//
//  UIColor+Hexcode.h
//  ESTCompanion
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//


@interface UIColor (Hexcode)

//
//  CATEGORY
//

/**
 * Translate a hexcode string ( i.e. #FFFFFF ) to a UIColor instance equivalent
 *
 * @return UIColor
 *
 * @example
 * NSString *hexcode = @"#FFFFFF";
 * UIColor *color = [UIColor colorFromHexCode:hexCode];
 */
+(UIColor *)colorFromHexCode:(NSString *)hexCode;



//
//  INSTANCE
//

/**
 * Returns a hexcode string ( i.e., #FFFFFF ) for the current color
 *
 * @return NSString
 *
 * @example
 * UIColor *color = [UIColor redColor];
 * NSString *hexColor = [color hexCodeColor];
 */
-(NSString *)hexCodeColor;

@end

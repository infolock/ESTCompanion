//
//  UIImage+RenderingMode.h
//  Helpful Bloke
//
//  Created by Jonathon Hibbard on 5/4/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

/**
 * Once again, borrowed from eLBee.
 *
 * Just an easy way to set an image's rendering mode to be of UIImageRenderingModeAlwaysTemplate
 */

@interface UIImage (RenderingMode)

+(UIImage *)imageWithRenderingMode:(NSString *)imageName;
+(UIImage *)imageWithRenderingModeFromImage:(UIImage *)image;

@end

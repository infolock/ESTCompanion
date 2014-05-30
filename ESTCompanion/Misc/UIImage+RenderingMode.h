//
//  UIImage+RenderingMode.h
//  Helpful Bloke
//
//  Created by Jonathon Hibbard on 5/4/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

/**
 * Once again, borrowed from eLBee.
 */

@interface UIImage (RenderingMode)

+(UIImage *)imageWithRenderingMode:(NSString *)imageName;
+(UIImage *)imageWithRenderingModeFromImage:(UIImage *)image;
@end
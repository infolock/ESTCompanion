//
//  UIImage+RenderingMode.m
//  Helpful Bloke
//
//  Created by Jonathon Hibbard on 5/4/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "UIImage+RenderingMode.h"

@implementation UIImage (RenderingMode)

+(UIImage *)imageWithRenderingMode:(NSString *)imageName {
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

+(UIImage *)imageWithRenderingModeFromImage:(UIImage *)image {
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return image;
}

@end

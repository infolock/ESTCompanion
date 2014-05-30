//
//  ImageViewRenderMode.m
//  Helpful Bloke
//
//  Created by Jonathon Hibbard on 5/4/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "ImageViewRenderMode.h"
#import "UIImage+RenderingMode.h"

@implementation ImageViewRenderMode

-(void)awakeFromNib {
    [super awakeFromNib];
    if(self.image) {
        self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
        self.image = [UIImage imageWithRenderingModeFromImage:self.image];
    }
}

@end

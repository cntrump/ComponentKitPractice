//
//  ImageComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "ImageComponent.h"

@implementation ImageComponent

+(instancetype)newWithImage:(UIImage*)image {
//    CKFlexboxComponent *flexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
//        .alignItems = CKFlexboxAlignItemsStretch,
//        .direction = CKFlexboxDirectionColumn
//    } children:{{imageComponent}}];

    return [super newWithComponent:CK::ImageComponentBuilder()
            .image(image)
            .attributes({
                {
                    @selector(setContentMode:), @(UIViewContentModeScaleAspectFit)
                },
                {
                    @selector(setBackgroundColor:), [UIColor whiteColor]
                }
            })
            .size({.height = 200})
            .build()];
}

@end

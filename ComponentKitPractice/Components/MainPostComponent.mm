//
//  MainPostComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "MainPostComponent.h"
#import "Post.h"
#import "InnerComponent.h"
#import <ComponentKit/ComponentKit.h>
#import <ComponentKit/CKComponentSubclass.h>

@implementation MainPostComponent

+(instancetype)newWithPost:(Post *)post andContext:(PostContext *)context {
    return [super newWithComponent:CK::InsetComponentBuilder()
            .insets({.top = 10, .bottom = 10, .left = 10, .right = 10})
            .component(CK::BackgroundLayoutComponentBuilder()
                       .component([InnerComponent newWithPost: post andContext: context])
                       .background(CK::ComponentBuilder().view({
                           [UIView class],
                           {
                               { @selector(setBackgroundColor:), [UIColor whiteColor] },
                               { CKComponentViewAttribute::LayerAttribute(@selector(setCornerRadius:)), @0.0 }
                           }}).build())
                       .build())
            .build()];
}

@end

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

    InnerComponent *innerComponent =
    [InnerComponent
     newWithPost: post
     andContext: context];

    CKComponent *backgroundComponent = CK::BackgroundLayoutComponentBuilder()
        .component(innerComponent)
        .background([CKComponent
                     newWithView:
                   {
                     [UIView class],
                     {
                       {
                           @selector(setBackgroundColor:), [UIColor whiteColor]
                       },
                       {
                           CKComponentViewAttribute::LayerAttribute(@selector(setCornerRadius:)), @0.0
                       }
                     }
                   }
                     size:{}])
        .build();

    CKComponent *insetComponent = CK::InsetComponentBuilder()
        .insets({.top = 10, .bottom = 10, .left = 10, .right = 10})
        .component(backgroundComponent)
        .build();

    return [super newWithComponent:insetComponent];
}

@end

//
//  PostIdentifyComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "PostIdentifyComponent.h"
#import "Post.h"
#import <ComponentTextKit/ComponentTextKit.h>

@implementation PostIdentifyComponent

+(instancetype)newWithPost:(Post *)post {
//    CKImageComponent *earthImageComponent = [CKImageComponent newWithImage:[UIImage imageNamed:@"earth"] attributes:{
//        {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)},
//    } size:{.height = RCRelativeDimension::Percent(1.0)}];

    return [super newWithComponent:CK::FlexboxComponentBuilder()
            .direction(CKFlexboxDirectionRow)
            .children({
                { CK::FlexboxComponentBuilder()
                    .direction(CKFlexboxDirectionRow)
                    .alignItems(CKFlexboxAlignItemsCenter)
                    .children({
                        { CK::ImageComponentBuilder()
                                .image(post.photo)
                                .attributes({
                                    {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)}
                                    //{CKComponentViewAttribute::LayerAttribute(@selector(setCornerRadius:)), @27.0}
                                    })
                                .size({}) // No op
                                .build(), .spacingBefore = 5.0, .flexBasis = RCRelativeDimension::Percent(0.125), .sizeConstraints = {.height = RCRelativeDimension::Percent(1.0)} },
                        { CK::FlexboxComponentBuilder()
                            .direction(CKFlexboxDirectionColumn)
                            .children({
                                {[CKLabelComponent newWithLabelAttributes:{
                                     .string = post.username,
                                     .font = [UIFont systemFontOfSize:14.0],
                                     .color = [UIColor blackColor]
                                 } viewAttributes: {
                                 } size: {
                                     .height = RCRelativeDimension::Percent(0.5)
                                 }]},
                                { CK::FlexboxComponentBuilder()
                                    .direction(CKFlexboxDirectionRow)
                                    .alignItems(CKFlexboxAlignItemsCenter)
                                    .size({.height = RCRelativeDimension::Percent(0.5)})
                                    .children({
                                            { [CKLabelComponent newWithLabelAttributes:{
                                                 .string = post.whenPosted,
                                                 .font = [UIFont systemFontOfSize:12.0],
                                                 .color = [UIColor lightGrayColor]
                                               } viewAttributes:{
                                               } size:{
                                                 .height = RCRelativeDimension::Percent(1.0)
                                               }]},
                                            { CK::ImageComponentBuilder()
                                                .image([UIImage imageNamed:@"earth"])
                                                .attributes({
                                                    {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)},
                                                })
                                                .size({12, 12})
                                                .build(),
                                                .spacingBefore = 5.0,
                                                .alignSelf = CKFlexboxAlignSelfCenter, /*.flexBasis = RCRelativeDimension::Percent(0.5)*/}})
                                    .build()}
                            })
                            .build(), .spacingBefore = 5.0, .position = {.left = 0} }
                    })
                    .build(), .sizeConstraints = {.width = RCRelativeDimension::Percent(0.9)} },
                { CK::ImageComponentBuilder()
                        .image([UIImage imageNamed:@"dots"])
                        .attributes({
                            {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)},
                            {@selector(setBackgroundColor:), [UIColor clearColor]}
                        })
                        .size({.height = RCRelativeDimension::Percent(1.0)})
                        .build(), .position = {.right = 0}, .sizeConstraints = {.width = RCRelativeDimension::Percent(0.1)} }
            })
            .build()];
}

@end

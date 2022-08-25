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

    CKComponent *profileImageComponent = CK::ImageComponentBuilder()
        .image(post.photo)
        .attributes({
            {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)}
            //{CKComponentViewAttribute::LayerAttribute(@selector(setCornerRadius:)), @27.0}
            })
        .size({}) // No op
        .build();

    CKLabelComponent *usernameLabelComponent =
    [CKLabelComponent
     newWithLabelAttributes:{
        .string = post.username,
        .font = [UIFont systemFontOfSize:14.0],
        .color = [UIColor blackColor]
    }
     viewAttributes:{}
     size:{
        .height = RCRelativeDimension::Percent(0.5)
    }];
    
    CKLabelComponent *whenPostedLabelComponent =
    [CKLabelComponent
     newWithLabelAttributes:{
        .string = post.whenPosted,
        .font = [UIFont systemFontOfSize:12.0],
        .color = [UIColor lightGrayColor]
    }
     viewAttributes:{}
     size:{
        .height = RCRelativeDimension::Percent(1.0)
    }];

//    CKImageComponent *earthImageComponent = [CKImageComponent newWithImage:[UIImage imageNamed:@"earth"] attributes:{
//        {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)},
//    } size:{.height = RCRelativeDimension::Percent(1.0)}];

    CKComponent *earthImageComponent = CK::ImageComponentBuilder()
        .image([UIImage imageNamed:@"earth"])
        .attributes({
            {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)},
        })
        .size({12, 12})
        .build();

    CKFlexboxComponent *whenPostedWithGlobaFlexBoxComponent = [CKFlexboxComponent newWithView:{} size:{.height = RCRelativeDimension::Percent(0.5)} style:{
        .direction = CKFlexboxDirectionRow,
        .alignItems = CKFlexboxAlignItemsCenter
    } children:{{whenPostedLabelComponent}, {earthImageComponent, .spacingBefore = 5.0, .alignSelf = CKFlexboxAlignSelfCenter, /*.flexBasis = RCRelativeDimension::Percent(0.5)*/}}];

    CKFlexboxComponent *labelNamesFlexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
        .direction = CKFlexboxDirectionColumn
    } children:{
        {usernameLabelComponent},
        {whenPostedWithGlobaFlexBoxComponent}
    }];

    UIImage *dotsImage = [UIImage imageNamed:@"dots"];
    CKComponent *imageComponent = CK::ImageComponentBuilder()
        .image(dotsImage)
        .attributes({
            {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)},
            {@selector(setBackgroundColor:), [UIColor clearColor]}
        })
        .size({.height = RCRelativeDimension::Percent(1.0)})
        .build();

    CKFlexboxComponent *profilePictureFlexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
        .direction = CKFlexboxDirectionRow,
        .alignItems = CKFlexboxAlignItemsCenter
    } children: {
        {profileImageComponent, .spacingBefore = 5.0, .flexBasis = RCRelativeDimension::Percent(0.125), .sizeConstraints = {.height = RCRelativeDimension::Percent(1.0)}},
        {labelNamesFlexBoxComponent, .spacingBefore = 5.0, .position = {.left = 0}}
    }];

    CKFlexboxComponent *flexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
        .direction = CKFlexboxDirectionRow
    } children:{
        {profilePictureFlexBoxComponent, .sizeConstraints = {.width = RCRelativeDimension::Percent(0.9)}},
        {imageComponent, .position = {.right = 0}, .sizeConstraints = {.width = RCRelativeDimension::Percent(0.1)}}
    }];

    return [super newWithComponent:flexBoxComponent];
}

@end

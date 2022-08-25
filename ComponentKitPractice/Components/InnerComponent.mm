//
//  InnerComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "InnerComponent.h"
#import "DescriptionComponent.h"
#import "Post.h"
#import "PostContext.h"
#import "BottomButtonsRowComponent.h"
#import "PostIdentifyComponent.h"
#import "ReactionCommentsComponent.h"
#import "Constants.h"
#import "ImageComponent.h"

@implementation InnerComponent

+(instancetype)newWithPost:(Post *)post andContext:(PostContext *)context {
    return [super newWithComponent:CK::FlexboxComponentBuilder()
        .alignItems(CKFlexboxAlignItemsStretch)
        .direction(CKFlexboxDirectionColumn)
        .children({
            { [PostIdentifyComponent newWithPost:post], .sizeConstraints = {.height = 54} },
            { [DescriptionComponent newWithDescription:post.postDescription] },
            { [ImageComponent newWithImage:post.postImage] },
            { [ReactionCommentsComponent newWith:post] },
            { horizontalComponent() },
            { [BottomButtonsRowComponent newWithImages:@[[UIImage imageNamed:@"like"], [UIImage imageNamed:@"comment"], [UIImage imageNamed:@"share"]]
                                     highlightedImages:@[[UIImage imageNamed:@"like_sup"], [UIImage imageNamed:@"comment"], [UIImage imageNamed:@"share"]]
                                                titles:@[@"Like", @"Comment", @"Share"]] }
        })
        .build()];
}

static CKComponent *horizontalComponent() {
    return CK::InsetComponentBuilder()
        .insets({.top = 0, .bottom = 5, .left = 10, .right = 10})
        .component(CK::ComponentBuilder()
                   .view({
                       [UIView class],
                       {
                           {@selector(setBackgroundColor:), Constants.lightGrayColor}
                       }})
                   .size({.height = 1})
                   .build())
        .build();
}

@end

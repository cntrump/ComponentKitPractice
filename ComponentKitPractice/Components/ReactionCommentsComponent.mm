//
//  ReactionCommentsComponent.mm
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/16/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "Post.h"
#import "ReactionCommentsComponent.h"
#import <ComponentTextKit/ComponentTextKit.h>

@implementation ReactionCommentsComponent

+(instancetype)newWith:(Post *)post {
    auto subComponents = std::vector<CKFlexboxComponentChild>{};

    NSMutableArray<CKComponent *> *imageComponents = [NSMutableArray new];

    [post.reactions enumerateKeysAndObjectsUsingBlock:^(NSString *reactionName, NSNumber *count, BOOL* stop) {
        [imageComponents addObject:CK::ImageComponentBuilder()
         .image([UIImage imageNamed:reactionName])
         .attributes({
             {@selector(setContentMode:), UIViewContentModeScaleAspectFit}
         })
         .size({15, 15})
         .build()];
    }];

    for (CKImageComponent * imageComponent in imageComponents) {
        subComponents.push_back({imageComponent, .spacingBefore = -1.0});
    }

    subComponents.push_back({ [CKLabelComponent newWithLabelAttributes:{
                                  .string = post.whoLiked,
                                  .font = [UIFont systemFontOfSize:12.0],
                                  .alignment = NSTextAlignmentLeft,
                                  .maximumNumberOfLines = 0
                               } viewAttributes:{
                                  {@selector(setBackgroundColor:), [UIColor whiteColor]},
                                  {@selector(setUserInteractionEnabled:), @NO},
                               } size:{ }],
                              .spacingBefore = 5.0 });

    return [super newWithComponent:CK::InsetComponentBuilder()
            .insets({.top = 10, .bottom = 10, .left = 10, .right = 10})
            .component(CK::FlexboxComponentBuilder()
                       .direction(CKFlexboxDirectionRow)
                       .alignItems(CKFlexboxAlignItemsCenter)
                       .justifyContent(CKFlexboxJustifyContentSpaceBetween)
                       .wrap(CKFlexboxWrapWrap)
                       .children({
                           {CK::FlexboxComponentBuilder()
                               .direction(CKFlexboxDirectionRow)
                               .justifyContent(CKFlexboxJustifyContentSpaceEvenly)
                               .alignItems(CKFlexboxAlignItemsCenter)
                               .children(subComponents)
                               .build()
                           },
                           {CK::FlexboxComponentBuilder()
                               .direction(CKFlexboxDirectionRow)
                               .alignItems(CKFlexboxAlignItemsCenter)
                               .justifyContent(CKFlexboxJustifyContentEnd)
                               .children({
                                   { [CKLabelComponent newWithLabelAttributes:{
                                         .string = [NSString stringWithFormat:@"%ld Comments", post.commentsCount],
                                         .font = [UIFont systemFontOfSize:12.0],
                                         .alignment = NSTextAlignmentRight,
                                         .maximumNumberOfLines = 0
                                     } viewAttributes:{
                                         { @selector(setBackgroundColor:), [UIColor whiteColor] },
                                         { @selector(setUserInteractionEnabled:), @NO},
                                     } size:{ }],
                                    .spacingAfter = 5.0 },
                                   { [CKLabelComponent newWithLabelAttributes:{
                                         .string = [NSString stringWithFormat:@"%ld Shares", post.sharesCount],
                                         .font = [UIFont systemFontOfSize:12.0],
                                         .alignment = NSTextAlignmentRight,
                                         .maximumNumberOfLines = 0
                                     } viewAttributes:{
                                         { @selector(setBackgroundColor:), [UIColor whiteColor] },
                                         { @selector(setUserInteractionEnabled:), @NO },
                                     } size:{ }] }
                               })
                               .build()
                           }
                       })
                       .build())
            .build()];
}

@end

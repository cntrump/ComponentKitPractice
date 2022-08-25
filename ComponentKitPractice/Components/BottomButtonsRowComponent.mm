//
//  BottomButtonsRowComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "BottomButtonsRowComponent.h"
#import "ButtonWithTitleComponent.h"

@implementation BottomButtonsRowComponent

+(instancetype)newWithImages:(NSArray<UIImage *> *)images highlightedImages:(NSArray<UIImage *> *)highlightedImages titles:(NSArray<NSString *> *)titles {
    auto subComponents = std::vector<CKFlexboxComponentChild>{};

    for (NSInteger i = 0; i < titles.count; i++) {
        subComponents.push_back({[ButtonWithTitleComponent
                                  newWithImage:images[i]
                                  highlightedImage:highlightedImages[i]
                                  title:titles[i]
                                  isClickable:(i == 0)], .alignSelf = CKFlexboxAlignSelfCenter});
    }

    return [super newWithComponent:CK::InsetComponentBuilder()
            .insets({.top = 5, .bottom = 5, .left = 10, .right = 10})
            .component(CK::FlexboxComponentBuilder()
                       .direction(CKFlexboxDirectionRow)
                       .justifyContent(CKFlexboxJustifyContentSpaceEvenly)
                       .alignItems(CKFlexboxAlignItemsCenter)
                       .children(subComponents)
                       .build())
            .build()];
}

@end

//
//  ButtonWithTitleComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "ButtonWithTitleComponent.h"
#import "Constants.h"
#import <ComponentKit/CKComponentSubclass.h>

@implementation ButtonWithTitleComponent {
    BOOL _isClickable;
}

+(instancetype)newWithImage:(UIImage*)image highlightedImage:(UIImage *)highlightedImage title:(NSString*)title isClickable:(BOOL)isClickable {
//    CKImageComponent *imageComponent = [CKImageComponent newWithImage:image attributes:{
//        {@selector(setContentMode:), @(UIViewContentModeScaleAspectFill)}
//    } size:{35, 35}];

    CKComponentScope scope(self);
    
    const BOOL isHighlighted = [scope.state() boolValue];

//    CKLabelComponent *labelComponent = [CKLabelComponent
//    newWithLabelAttributes:{
//        .string = title,
//        .font = [UIFont systemFontOfSize:12.0],
//        .color = textColor
//    }
//    viewAttributes:{}
//    size:{ }];

    ButtonWithTitleComponent *finalComponent = [super newWithComponent:CK::FlexboxComponentBuilder()
                                                .direction(CKFlexboxDirectionRow)
                                                .alignItems(CKFlexboxAlignItemsCenter)
                                                .children({
                                                    {CK::ButtonComponentBuilder()
                                                            .action(@selector(buttonTapped))
                                                            .options({
                                                                .images = {isHighlighted ? highlightedImage : image},
                                                                .titleAlignment = NSTextAlignmentLeft,
                                                                .size = {30, 30},
                                                                .tapTargetExpansion = {.right = -5}
                                                            })
                                                            .build()},
                                                    {CK::ComponentBuilder()
                                                        .view({
                                                            [UIView class],
                                                            {{@selector(setBackgroundColor:), [UIColor clearColor]}}
                                                        })
                                                        .size({.width = 5})
                                                        .build()},
                                                    {CK::ButtonComponentBuilder()
                                                            .action(@selector(buttonTapped))
                                                            .options({
                                                                .titleAlignment = NSTextAlignmentLeft,
                                                                .titleFont = [UIFont systemFontOfSize:12.0],
                                                                .selected = isHighlighted,
                                                                .titleColors = {isHighlighted ? Constants.blueColor : [UIColor blackColor]},
                                                                .titles = {title}
                                                            })
                                                            .build()}
                                                })
                                                .build()];
    finalComponent->_isClickable = isClickable;

    return finalComponent;
}

-(void)buttonTapped {
    if (_isClickable) {
        [self updateState:^(NSNumber *oldLikeState) {
          return [oldLikeState boolValue] ? @NO : @YES;
        } mode:CKUpdateModeSynchronous];
    }
}

+ (id)initialState
{
  return @NO;
}

@end

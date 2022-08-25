//
//  DescriptionComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "DescriptionComponent.h"
#import <ComponentTextKit/ComponentTextKit.h>

@implementation DescriptionComponent

+(instancetype)newWithDescription:(NSString *)description {
    CKLabelComponent *labelComponent =
    [CKLabelComponent
     newWithLabelAttributes:
    {
        .string = description,
        .font = [UIFont systemFontOfSize:14.0]
    }
     viewAttributes:{
        {
            @selector(setBackgroundColor:), [UIColor whiteColor]
        },
        {
            @selector(setUserInteractionEnabled:), @NO
        },
    }
     size:{ }];
    return [super newWithComponent: CK::InsetComponentBuilder().insets({.top = 5, .bottom = 15, .left = 10, .right = 10}).component(labelComponent).build()];
}

@end

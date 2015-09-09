//
//  ProjectFont.m
//  ManageAttributedString
//
//  Created by daisuke on 2015/9/7.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "ProjectFont.h"

@implementation ProjectFont

+ (NSShadow *)shadowColor:(UIColor *)color {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = color;
    shadow.shadowOffset = CGSizeMake(2, 2);
    return shadow;
}

@end

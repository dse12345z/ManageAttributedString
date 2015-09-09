//
//  NSString+Manage.m
//  ManageAttributedString
//
//  Created by daisuke on 2015/9/8.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "NSString+Manage.h"
#import <objc/runtime.h>

typedef NSMutableAttributedString * (^AttributedString)(id input);

@implementation NSString (ManageNSString)
// 新增 Attributes 必需添加 @dynamic
@dynamic add;
@dynamic font;
@dynamic color;
@dynamic bColor;
@dynamic shadowColor;

#pragma mark - instance method

- (NSMutableAttributedString * (^)(NSString *addString))add {
    __weak typeof(self) weakSelf = self;
    
    return ^NSMutableAttributedString *(NSString *input) {
        NSAttributedString *oldAttributeString = [[NSAttributedString alloc] initWithString:weakSelf];
        NSAttributedString *newAttributeString = [[NSAttributedString alloc] initWithString:input];
        NSMutableAttributedString *multAttributeString = [[NSMutableAttributedString alloc] init];
        [multAttributeString appendAttributedString:oldAttributeString];
        [multAttributeString appendAttributedString:newAttributeString];
        return multAttributeString;
    };
}

#pragma mark - instance attributes method
// 新增 Attributes 必需添加 method, 與相對應 Attributes NSString

- (NSMutableAttributedString *(^)(UIFont *font))font {
    return [self attributesType:NSFontAttributeName];
}

- (NSMutableAttributedString *(^)(UIColor *color))color {
    return [self attributesType:NSForegroundColorAttributeName];
}

- (NSMutableAttributedString *(^)(UIColor *bColor))bColor {
    return [self attributesType:NSBackgroundColorAttributeName];
}

- (NSMutableAttributedString *(^)(NSShadow *shadowColor))shadowColor {
    return [self attributesType:NSShadowAttributeName];
}

#pragma mark - private instance method

- (AttributedString)attributesType:(NSString *)attributesType {
    __weak typeof(self) weakSelf = self;
    
    return ^NSMutableAttributedString *(NSString *input) {
        NSRange range = NSMakeRange(0, weakSelf.length);
        NSMutableAttributedString *multString = [[NSMutableAttributedString alloc] initWithString:weakSelf];
        [multString addAttribute:attributesType value:input range:range];
        return multString;
    };
}

@end

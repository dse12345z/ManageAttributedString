//
//  NSMutableAttributedString+Manage.m
//  ManageAttributedString
//
//  Created by daisuke on 2015/9/3.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "NSMutableAttributedString+Manage.h"
#import <objc/runtime.h>

typedef NSMutableAttributedString * (^AttributedString)(id input);

@implementation NSMutableAttributedString (ManageAttributedString)
// 新增 Attributes 必需添加 @dynamic
@dynamic add;
@dynamic font;
@dynamic color;
@dynamic bColor;
@dynamic shadowColor;

#pragma mark - instance method

- (NSMutableAttributedString * (^)(id addString))add {
    __weak typeof(self) weakSelf = self;
    
    return ^NSMutableAttributedString *(id input) {
        if ([input isKindOfClass:[NSString class]]) {
            NSMutableAttributedString *newAttributeString = [[NSMutableAttributedString alloc] initWithString:input];
            [weakSelf appendAttributedString:newAttributeString];
        }
        else if ([input isKindOfClass:[NSMutableAttributedString class]]) {
            NSAttributedString *newAttributeString = [[NSAttributedString alloc] initWithAttributedString:input];
            [weakSelf appendAttributedString:newAttributeString];
        }
        else {
            NSAssert(0, @"add(Obj) 檢查 Obj 是否是 NSString 或 NSMutableAttributedString 類別");
        }
        return weakSelf;
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
        NSRange range = NSMakeRange(0, weakSelf.string.length);
        [weakSelf addAttribute:attributesType value:input range:range];
        return weakSelf;
    };
}

@end

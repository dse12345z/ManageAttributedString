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

@implementation NSMutableAttributedString (Manage)
@dynamic append;
@dynamic clear;

// 新增 Attributes 必需添加 @dynamic
// 字型
@dynamic font;

// 顏色
@dynamic color, backgroundColor, strokeColor, underlineColor, strikethroughColor;

// 特效
@dynamic shadow, link, ligature, strokeWidth, textEffect, obliqueness, expansion, paragraphStyle, strikethroughStyle, underlineStyle;

// 排版
@dynamic kern, baselineOffset, writingDirection, verticalGlyph;

// 附加
//@dynamic attachment;

#pragma mark - instance method

- (NSMutableAttributedString * (^)(id addString))append {
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
        else if ([input isKindOfClass:[UIImage class]]) {
            NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
            textAttachment.image = (UIImage *)input;
            NSAttributedString *imageAttributedString = [NSAttributedString attributedStringWithAttachment:textAttachment];
            [weakSelf appendAttributedString:imageAttributedString];
        }
        else {
            NSAssert(0, @"add(Obj) 檢查 Obj 是否是 NSString 或 NSMutableAttributedString 類別");
        }
        return weakSelf;
    };
}

- (NSMutableAttributedString *(^)(void))clear {
    __weak typeof(self) weakSelf = self;
    return ^NSMutableAttributedString *(void) {
        [weakSelf.mutableString setString:@""];
        return weakSelf;
    };
}

#pragma mark - instance attributes method
// 新增 Attributes 必需添加 method, 與相對應 Attributes NSString

- (NSMutableAttributedString *(^)(UIFont *font))font {
    return [self attributesType:NSFontAttributeName];
}

- (NSMutableAttributedString *(^)(NSParagraphStyle *paragraphStyle))paragraphStyle {
    return [self attributesType:NSParagraphStyleAttributeName];
}

- (NSMutableAttributedString *(^)(UIColor *color))color {
    return [self attributesType:NSForegroundColorAttributeName];
}

- (NSMutableAttributedString *(^)(UIColor *backgroundColor))backgroundColor {
    return [self attributesType:NSBackgroundColorAttributeName];
}

- (NSMutableAttributedString *(^)(NSNumber *ligature))ligature {
    return [self attributesType:NSLigatureAttributeName];
}

- (NSMutableAttributedString *(^)(NSNumber *kern))kern {
    return [self attributesType:NSKernAttributeName];
}

- (NSMutableAttributedString *(^)(NSNumber *strikethroughStyle))strikethroughStyle {
    return [self attributesType:NSStrikethroughStyleAttributeName];
}

- (NSMutableAttributedString *(^)(NSNumber *underlineStyle))underlineStyle {
    return [self attributesType:NSUnderlineStyleAttributeName];
}

- (NSMutableAttributedString *(^)(UIColor *strokeColor))strokeColor {
    return [self attributesType:NSStrokeColorAttributeName];
}

- (NSMutableAttributedString *(^)(NSNumber *strokeWidth))strokeWidth {
    return [self attributesType:NSStrokeWidthAttributeName];
}

- (NSMutableAttributedString *(^)(NSShadow *shadow))shadow {
    return [self attributesType:NSShadowAttributeName];
}

- (NSMutableAttributedString *(^)(NSString *textEffect))textEffect {
    return [self attributesType:NSTextEffectAttributeName];
}

//- (NSMutableAttributedString *(^)(NSTextAttachment *attachment))attachment {
//    return [self attributesType:NSAttachmentAttributeName];
//}

- (NSMutableAttributedString *(^)(NSURL *link))link {
    return [self attributesType:NSLinkAttributeName];
}

- (NSMutableAttributedString *(^)(NSNumber *baselineOffset))baselineOffset {
    return [self attributesType:NSBaselineOffsetAttributeName];
}

- (NSMutableAttributedString *(^)(UIColor *underlineColor))underlineColor {
    return [self attributesType:NSUnderlineColorAttributeName];
}

- (NSMutableAttributedString *(^)(UIColor *strikethroughColor))strikethroughColor {
    return [self attributesType:NSStrikethroughColorAttributeName];
}

- (NSMutableAttributedString *(^)(NSNumber *obliqueness))obliqueness {
    return [self attributesType:NSObliquenessAttributeName];
}

- (NSMutableAttributedString *(^)(NSNumber *expansion))expansion {
    return [self attributesType:NSExpansionAttributeName];
}

- (NSMutableAttributedString *(^)(NSArray *writingDirection))writingDirection {
    return [self attributesType:NSWritingDirectionAttributeName];
}

- (NSMutableAttributedString *(^)(NSNumber *verticalGlyph))verticalGlyph {
    return [self attributesType:NSVerticalGlyphFormAttributeName];
}

#pragma mark - private instance method

- (AttributedString)attributesType:(NSString *)attributesType {
    __weak typeof(self) weakSelf = self;
    
    return ^NSMutableAttributedString *(id input) {
        NSRange range = NSMakeRange(0, weakSelf.string.length);
        [weakSelf addAttribute:attributesType value:input range:range];
        return weakSelf;
    };
}

@end

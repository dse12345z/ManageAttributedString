//
//  NSString+Manage.h
//  ManageAttributedString
//
//  Created by daisuke on 2015/9/8.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Manage)

// 新增 Attributes 必需添加 @property
@property (nonatomic, readonly) NSMutableAttributedString * (^add)(NSString *addString);
@property (nonatomic, readonly) NSMutableAttributedString * (^font)(UIFont *font);
@property (nonatomic, readonly) NSMutableAttributedString * (^paragraphStyle)(NSParagraphStyle *paragraphStyle);
@property (nonatomic, readonly) NSMutableAttributedString * (^color)(UIColor *color);
@property (nonatomic, readonly) NSMutableAttributedString * (^backgroundColor)(UIColor *backgroundColor);
@property (nonatomic, readonly) NSMutableAttributedString * (^ligature)(NSNumber *ligature);
@property (nonatomic, readonly) NSMutableAttributedString * (^kern)(NSNumber *kern);
@property (nonatomic, readonly) NSMutableAttributedString * (^strikethroughStyle)(NSNumber *strikethroughStyle);
@property (nonatomic, readonly) NSMutableAttributedString * (^underlineStyle)(NSNumber *underlineStyle);
@property (nonatomic, readonly) NSMutableAttributedString * (^strokeColor)(UIColor *strokeColor);
@property (nonatomic, readonly) NSMutableAttributedString * (^strokeWidth)(NSNumber *strokeWidth);
@property (nonatomic, readonly) NSMutableAttributedString * (^shadow)(NSShadow *shadow);
@property (nonatomic, readonly) NSMutableAttributedString * (^textEffect)(NSString *textEffect);
@property (nonatomic, readonly) NSMutableAttributedString * (^attachment)(NSTextAttachment *attachment);
@property (nonatomic, readonly) NSMutableAttributedString * (^link)(NSURL *link);
@property (nonatomic, readonly) NSMutableAttributedString * (^baselineOffset)(NSNumber *baselineOffset);
@property (nonatomic, readonly) NSMutableAttributedString * (^underlineColor)(UIColor *underlineColor);
@property (nonatomic, readonly) NSMutableAttributedString * (^strikethroughColor)(UIColor *strikethroughColor);
@property (nonatomic, readonly) NSMutableAttributedString * (^obliqueness)(NSNumber *obliqueness);
@property (nonatomic, readonly) NSMutableAttributedString * (^expansion)(NSNumber *expansion);
@property (nonatomic, readonly) NSMutableAttributedString * (^writingDirection)(NSArray *writingDirection);
@property (nonatomic, readonly) NSMutableAttributedString * (^verticalGlyph)(NSNumber *verticalGlyph);

@end

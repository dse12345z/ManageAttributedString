//
//  NSString+Manage.h
//  ManageAttributedString
//
//  Created by daisuke on 2015/9/8.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (ManageNSString)

// 新增 Attributes 必需添加 @property
@property (nonatomic, readonly) NSMutableAttributedString * (^add)(NSString *addString);
@property (nonatomic, readonly) NSMutableAttributedString * (^font)(UIFont *font);
@property (nonatomic, readonly) NSMutableAttributedString * (^color)(UIColor *color);
@property (nonatomic, readonly) NSMutableAttributedString * (^bColor)(UIColor *bColor);
@property (nonatomic, readonly) NSMutableAttributedString * (^shadowColor)(NSShadow *shadowColor);

@end

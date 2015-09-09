//
//  ProjectFont.h
//  ManageAttributedString
//
//  Created by daisuke on 2015/9/7.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define RGBColor(r, g, b, a) [UIColor colorWithRed : (r / 255.0)green : (g / 255.0)blue : (b / 255.0)alpha : a]

///---------------------------------------------------------------------------------------
/// @name 字型
///---------------------------------------------------------------------------------------

#define DFSTHeitiTCLight10 [UIFont fontWithName:@"STHeitiTC-Light" size:10]
#define DFSTHeitiTCLight15 [UIFont fontWithName:@"STHeitiTC-Light" size:15]
#define DFSTHeitiTCLight30 [UIFont fontWithName:@"STHeitiTC-Light" size:30]

#define DFSTHeitiTCMedium10 [UIFont fontWithName:@"STHeitiTC-Medium" size:10]
#define DFSTHeitiTCMedium15 [UIFont fontWithName:@"STHeitiTC-Medium" size:15]
#define DFSTHeitiTCMedium30 [UIFont fontWithName:@"STHeitiTC-Medium" size:30]

#define DFHelveticaNeue10 [UIFont fontWithName:@"HelveticaNeue" size:10]
#define DFHelveticaNeue15 [UIFont fontWithName:@"HelveticaNeue" size:15]
#define DFHelveticaNeue30 [UIFont fontWithName:@"HelveticaNeue" size:30]

#define DFHelveticaNeueBold10 [UIFont fontWithName:@"HelveticaNeue-Bold" size:10]
#define DFHelveticaNeueBold15 [UIFont fontWithName:@"HelveticaNeue-Bold" size:15]
#define DFHelveticaNeueBold30 [UIFont fontWithName:@"HelveticaNeue-Bold" size:30]

///---------------------------------------------------------------------------------------
/// @name 字型顏色
///---------------------------------------------------------------------------------------

#define DFColorBlack [UIColor blackColor]
#define DFColorBlue [UIColor blueColor]
#define DFColorOrange RGBColor(243, 138, 63, 1.0)
#define DFColorPurple [UIColor purpleColor]
#define DFColorRed [UIColor redColor]
#define DFColorYellow [UIColor yellowColor]

///---------------------------------------------------------------------------------------
/// @name 字型陰影
///---------------------------------------------------------------------------------------

#define DFShadowColorYellow [ProjectFont shadowColor:DFColorYellow]
#define DFShadowColorOrange [ProjectFont shadowColor:DFColorOrange]

@interface ProjectFont : NSObject

+ (NSShadow *)shadowColor:(UIColor *)color;

@end

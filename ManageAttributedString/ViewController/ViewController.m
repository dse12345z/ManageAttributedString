//
//  ViewController.m
//  ManageAttributedString
//
//  Created by daisuke on 2015/8/21.
//  Copyright (c) 2015年 dse12345z. All rights reserved.
//

#import "ViewController.h"
#import "ProjectFont.h"
#import "NSMutableAttributedString+Manage.h"
#import "NSString+Manage.h"
#import "UIImage+Manage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label9;
@property (weak, nonatomic) IBOutlet UILabel *label10;
@property (weak, nonatomic) IBOutlet UILabel *label11;
@property (weak, nonatomic) IBOutlet UILabel *label12;
@property (weak, nonatomic) IBOutlet UILabel *label13;
@property (weak, nonatomic) IBOutlet UILabel *label14;
@property (weak, nonatomic) IBOutlet UILabel *label15;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIFont *helveticaNeue10 = [UIFont fontWithName:@"HelveticaNeue" size:10];
    UIFont *helveticaNeue15 = [UIFont fontWithName:@"HelveticaNeue" size:15];
    UIFont *helveticaNeue30 = [UIFont fontWithName:@"HelveticaNeue" size:30];
    NSMutableAttributedString *mutableString = [NSMutableAttributedString new];
    mutableString.append(@"Label1 ");
    mutableString.append(@"Hello".font(helveticaNeue10));
    mutableString.append(@" Word ".font(helveticaNeue15));
    mutableString.append(@"99999".font(helveticaNeue30));
    self.label1.attributedText = mutableString;
    
    /* the same below
     multString.append(@"Label ")
     .append(@"Hello".font(helveticaNeue10))
     .append(@" Word ".font(helveticaNeue15))
     .append(@"99999".font(helveticaNeue30));*/
    
    /* ==================================================================== */
    // area scope
    mutableString.clear()
    .append(@"Label2  ")
    .append(@"Yooooooo  ".color([UIColor redColor]))
    .append(@"Nooooooo");
    self.label2.attributedText = mutableString;
    
    // global scope
    mutableString.clear()
    .append(@"Label3  ")
    .append(@"Yooooooo  ")
    .append(@"Nooooooo")
    .color([UIColor redColor]);
    self.label3.attributedText = mutableString;
    
    /* ==================================================================== */
    // insert image
    UIImage *image = [UIImage imageNamed:@"btn_nav_QRscan"];
    mutableString.clear()
    .append(@"Label4  ")
    .append(@"Yooooooo  ".append(image.bounds(CGRectMake(0, 0, 22, 22))))
    .append(@"Nooooooo");
    self.label4.attributedText = mutableString;
    
    
    // baseline
    /*
     image convert NSMutableAttributedString use image.attributedString() or
     use image.bounds, the bounds return type is NSMutableAttributedString
     */
    NSMutableAttributedString *imageAttributedString = image.bounds(CGRectMake(0, 0, 22, 22)).baselineOffset(@(-5));
    mutableString.clear()
    .append(@"Label5  ")
    .append(@"Yooooooo  ".append(imageAttributedString))
    .append(@"Nooooooo");
    self.label5.attributedText = mutableString;
    
    /* ==================================================================== */
    /*
     color, backgroundColor, strokeColor/strokeWidth, underlineColor/underlineStyle, strikethroughColor/strikethroughStyle
     */
    mutableString.clear()
    .append(@"Label6  ")
    .append(@"color ".color([UIColor redColor]))
    .append(@"backgroundColor ".backgroundColor([UIColor greenColor]));
    self.label6.attributedText = mutableString;
    
    mutableString.clear()
    .append(@"Label7  ")
    .append(@"strokeColor ".strokeColor([UIColor blueColor]).strokeWidth(@2))
    .append(@"underlineColor ".underlineColor([UIColor yellowColor]).underlineStyle(@2));
    self.label7.attributedText = mutableString;
    
    mutableString.clear()
    .append(@"Label8  ")
    .append(@"strikethroughColor ".strikethroughColor([UIColor brownColor]).strikethroughStyle(@2));
    self.label8.attributedText = mutableString;
    
    /* ==================================================================== */
    /*
     shadow, link, ligature, textEffect, obliqueness, expansion
     */
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor darkGrayColor];
    shadow.shadowBlurRadius = 1;
    shadow.shadowOffset = CGSizeMake(1, 1);
    mutableString.clear()
    .append(@"Label9  ")
    .append(@"shadow ".shadow(shadow))
    .append(@"link ".link([NSURL URLWithString:@"https://github.com/dse12345z/ManageAttributedString"]))
    .append(@"ligature ( ffff ) ".font(helveticaNeue15).ligature(@1));
    self.label9.attributedText = mutableString;
    
    mutableString.clear()
    .append(@"Label10  ")
    .append(@"textEffect ".textEffect(NSTextEffectLetterpressStyle))
    .append(@"obliqueness ".obliqueness(@0.5));
    self.label10.attributedText = mutableString;
    
    mutableString.clear()
    .append(@"Label11  ")
    .append(@"expansion ".expansion(@0.5));
    self.label11.attributedText = mutableString;
    
    /* ==================================================================== */
    /*
     kern, baselineOffset, writingDirection, verticalGlyph
     */
    mutableString.clear()
    .append(@"Label12  ")
    .append(@"kern ".kern(@25));
    self.label12.attributedText = mutableString;
    
    mutableString.clear()
    .append(@"Label13  ")
    .append(@"baselineOffset".baselineOffset(@5));
    self.label13.attributedText = mutableString;
    
    NSArray *writingDirections = @[@(NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride)];
    mutableString.clear()
    .append(@"Label14  ")
    .append(@"writingDirection".writingDirection(writingDirections));
    self.label14.attributedText = mutableString;
    
    /* ==================================================================== */
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    mutableString.clear()
    .append(@"Label15  ")
    .append(@"paragraphStyle ").paragraphStyle(paragraphStyle);
    self.label15.attributedText = mutableString;
}

@end

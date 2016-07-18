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
@property (weak, nonatomic) IBOutlet UILabel *lable10;
@property (weak, nonatomic) IBOutlet UILabel *label11;
@property (weak, nonatomic) IBOutlet UILabel *label12;
@property (weak, nonatomic) IBOutlet UILabel *label13;
@property (weak, nonatomic) IBOutlet UILabel *label14;

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
    
    // insert image
    UIImage *image = [UIImage imageNamed:@"btn_nav_QRscan"];
    mutableString.clear()
    .append(@"Label4  ")
    .append(@"Yooooooo  ".append(image.bounds(CGRectMake(0, 0, 22, 22))))
    .append(@"Nooooooo");
    self.label4.attributedText = mutableString;
    
    // baseline
    mutableString.clear()
    .append(@"Label5  ")
    .append(@"Yooooooo  ".append(image))
    .append(@"Nooooooo");
    self.label5.attributedText = mutableString;
}

@end

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

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // label 只改變大小, add(NSString 點運算都是對這個 string 做改變)
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 50)];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIFont *helveticaNeue10 = [UIFont fontWithName:@"HelveticaNeue" size:10];
    UIFont *helveticaNeue15 = [UIFont fontWithName:@"HelveticaNeue" size:15];
    UIFont *helveticaNeue30 = [UIFont fontWithName:@"HelveticaNeue" size:30];
    
    NSMutableAttributedString *multString = [NSMutableAttributedString new];
    multString.add(@"Label ");
    multString.add(@"Hello".font(helveticaNeue10));
    multString.add(@" Word ".font(helveticaNeue15));
    multString.add(@"99999".font(helveticaNeue30));
    label.attributedText = multString;
    
    
    // label 相同, 這裡使用 define 字型、顏色
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 50)];
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    
    [multString.mutableString setString:@""];
    multString.add(@"Label1 ");
    multString.add(@"Hello".font(DFHelveticaNeue10));
    multString.add(@" Word ".font(DFHelveticaNeue15));
    multString.add(@"99999".font(DFHelveticaNeue30));
    label1.attributedText = multString;
    
    
    // label2 只改變顏色, 第一個 multString add() 之後都可以省略 multString, 直接點運算接下一個 add()
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 320, 50)];
    label2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label2];
    
    [multString.mutableString setString:@""];
    multString.add(@"Label2 ")
    .add(@"Hello".color(DFColorBlack))
    .add(@" Word ".color(DFColorOrange))
    .add(@"99999".color(DFColorBlue));
    label2.attributedText = multString;
    
    
    // label3 個別改變三個字段的顏色、字型
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 320, 50)];
    label3.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label3];
    
    [multString.mutableString setString:@""];
    multString.add(@"Label3 ")
    .add(@"Hello".color(DFColorBlack).font(DFHelveticaNeue10))
    .add(@" Word ".color(DFColorOrange).font(DFHelveticaNeue15))
    .add(@"99999".color(DFColorBlue).font(DFHelveticaNeue30));
    label3.attributedText = multString;
    
    
    // label4 可以新增自己需要的 Attributes 方法 (etc. NSBackgroundColorAttributeName、NSShadowAttributeName ...)
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, 320, 50)];
    label4.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label4];
    
    [multString.mutableString setString:@""];
    multString.add(@"Label4 ")
    .add(@"Hello".color(DFColorBlack).font(DFHelveticaNeue10))
    .add(@" Word ".color(DFColorOrange).font(DFHelveticaNeue15).bColor(DFColorBlue))
    .add(@"99999".color(DFColorBlue).font(DFHelveticaNeue30).shadowColor(DFShadowColorOrange));
    label4.attributedText = multString;
    
    
    // label5 統一字型顏色, add() 所有字段, 在做後一個 add() 「外部」 點運算 color() 就可以統一所有字段
    // add() 在括號內可以先做自己的字型改變, 在做統一顏色
    // add() 如果括號內有做顏色改變, 最後統一顏色, ()
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 320, 50)];
    label5.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label5];
    
    [multString.mutableString setString:@""];
    multString.add(@"Label5 ")
    .add(@"Hello".color(DFColorRed))
    .add(@" Word ".font(DFSTHeitiTCLight10))
    .add(@"99999").color(DFColorBlue);
    label5.attributedText = multString;
    
    
    // label6 迴圈
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(0, 350, 320, 50)];
    label6.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label6];
    
    [multString.mutableString setString:@""];
    NSArray *arrays = @[@"Label6 ", @"Hello", @" Word ", @"99999"];
    for (NSString *string in arrays) {
        multString.add(string.font(DFSTHeitiTCLight15));
    }
    //統一顏色
    multString.color(DFColorBlue);
    label6.attributedText = multString;
}

@end

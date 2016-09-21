//
//  SaveButton.m
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJSaveButton.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation BXJSaveButton

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
 
        UILabel * lable=[[UILabel alloc]initWithFrame:CGRectMake(10+17, 0, 33, 44)];
        lable.text=@"保存";
        lable.textColor=UIColorFromRGB(0x878787);
        lable.font=[UIFont systemFontOfSize:14.0];
        lable.textAlignment=NSTextAlignmentLeft;
        [self addSubview:lable];
    }
    return self;
}

@end

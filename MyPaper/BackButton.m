//
//  BackButton.m
//  Ugly
//
//  Created by YearIce on 16/7/16.
//  Copyright © 2016年 SourceCode. All rights reserved.
//

#import "BackButton.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation BackButton

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        UIImageView * imageback=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 17, 44)];
        imageback.image=[UIImage imageNamed:@"backlogo"];
        [self addSubview:imageback];
        
        UILabel * lable=[[UILabel alloc]initWithFrame:CGRectMake(10+17, 0, 33, 44)];
        lable.text=@"返回";
        lable.textColor=UIColorFromRGB(0x878787);
        lable.font=[UIFont systemFontOfSize:14.0];
        lable.textAlignment=NSTextAlignmentLeft;
        [self addSubview:lable];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

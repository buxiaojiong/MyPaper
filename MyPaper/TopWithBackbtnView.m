//
//  TopWithBackbtnView.m
//  Ugly
//
//  Created by YearIce on 16/7/16.
//  Copyright © 2016年 SourceCode. All rights reserved.
//

#import "TopWithBackbtnView.h"

@implementation TopWithBackbtnView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        BackButton * backbtn=[[BackButton alloc]initWithFrame:CGRectMake(0, 20, 60, 64)];
        [backbtn addTarget:self action:@selector(backaction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backbtn];
        
        self.layer.shadowColor=[[UIColor blackColor] CGColor];
        self.layer.shadowOffset=CGSizeMake(0, 1);
        self.layer.shadowRadius=1;
        self.layer.shadowOpacity=0.1;
    }
    return self;
}
-(void)backaction:(id)sender
{
    if (_BackNacAction) {
        _BackNacAction();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

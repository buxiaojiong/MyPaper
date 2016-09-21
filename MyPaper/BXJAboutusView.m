//
//  BXJAboutusView.m
//  MyPaper
//
//  Created by sourcecode on 16/8/3.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJAboutusView.h"
#import "TopWithBackbtnView.h"

#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJAboutusView ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation BXJAboutusView

- (instancetype)initWithFrame:(CGRect)frame withnav:(UINavigationController *)nav{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
        
        TopWithBackbtnView *topBackBtnView = [[TopWithBackbtnView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
        [self addSubview:topBackBtnView];
        topBackBtnView.BackNacAction = ^(){
            
            if (!nav) {
                
                [UIView  animateWithDuration:0.3 animations:^{
                    
                    self.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
                    
                } completion:^(BOOL finished) {
                    
                    [self removeFromSuperview];
                }];
                
            }else{
                
                [nav popViewControllerAnimated:YES];
                
            }
            
    
            
        };
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 80, 44)];
        [topBackBtnView addSubview:titleLabel];
        
        CGPoint center = CGPointMake(WIDTH/2, topBackBtnView.center.y+10);
        titleLabel.center = center;
        titleLabel.font = [UIFont systemFontOfSize:17];
        titleLabel.textColor = UIColorFromRGB(0x2b2b2b);
        titleLabel.text = @"关于我们";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 65, WIDTH, HEIGHT)];
        [self addSubview:self.textView];
        self.textView.editable = NO;
        self.textView.selectable = NO;
        self.textView.font = [UIFont systemFontOfSize:15];
        
        self.textView.text = @"丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫丑小丫";
        
    }
    return self;
}

@end

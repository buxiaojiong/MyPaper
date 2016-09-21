//
//  BXJFeedBackView.m
//  MyPaper
//
//  Created by sourcecode on 16/8/3.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJFeedBackView.h"
#import "BXJPostButton.h"
#import "TopWithBackbtnView.h"

#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJFeedBackView ()
<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *placeholderLabel;

@property (nonatomic, strong) UINavigationController *navc;

@end

@implementation BXJFeedBackView

- (instancetype)initWithFrame:(CGRect)frame withnav:(UINavigationController *)nav{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.navc  = nav;
        
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
        titleLabel.text = @"用户反馈";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        BXJPostButton *postBtn = [[BXJPostButton alloc] initWithFrame:CGRectMake( WIDTH - 60 - 10,20, 60, 64)];
        [topBackBtnView addSubview:postBtn];
        [postBtn addTarget:self action:@selector(postAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 65+10, WIDTH-30, HEIGHT)];
        [self addSubview:self.textView];
        self.textView.font = [UIFont systemFontOfSize:15];
        
        self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 300, 19)];
        self.placeholderLabel.font = [UIFont systemFontOfSize:17];
        self.placeholderLabel.textColor = UIColorFromRGB(0x878787);
        [self.textView addSubview:self.placeholderLabel];
        self.placeholderLabel.text = @"请发表您宝贵的意见和建议!";
        self.placeholderLabel.textAlignment = NSTextAlignmentLeft;
        self.textView.font = [UIFont systemFontOfSize:17];
        self.textView.delegate = self;
        
//        self.textView.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void)postAction:(id)sender
{
    if (_saveFeedbackAction) {
        _saveFeedbackAction(self.textView.text,NO);
        
        if (!self.navc) {
            [UIView  animateWithDuration:0.3 animations:^{
                
                self.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
                
            } completion:^(BOOL finished) {
                
                [self removeFromSuperview];
                
            }];
        }else{
            
            [self.navc popViewControllerAnimated:YES];
            
        }
        

    }
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        self.placeholderLabel.text = @"请发表您宝贵的意见和建议!";
    }else{
        self.placeholderLabel.text = @"";
    }
}

@end

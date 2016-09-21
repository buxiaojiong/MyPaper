//
//  MySignatureView.m
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMySignatureView.h"
#import "TopWithBackbtnView.h"
#import "BXJSaveButton.h"

#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJMySignatureView ()
<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) UIView *contentView;


@end

@implementation BXJMySignatureView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
        
        TopWithBackbtnView *topBackBtnView = [[TopWithBackbtnView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
        [self addSubview:topBackBtnView];
        topBackBtnView.BackNacAction = ^(){
            
            [UIView  animateWithDuration:0.3 animations:^{
                
                self.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
                
            } completion:^(BOOL finished) {
                
                if (_saveSignatureAction) {
                    _saveSignatureAction(nil,NO);
                }
                
                [self removeFromSuperview];
            }];
            
        };
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 80, 44)];
        [topBackBtnView addSubview:titleLabel];
        
        CGPoint center = CGPointMake(WIDTH/2, topBackBtnView.center.y+10);
        titleLabel.center = center;
        titleLabel.font = [UIFont systemFontOfSize:17];
        titleLabel.textColor = UIColorFromRGB(0x2b2b2b);
        titleLabel.text = @"个性签名";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        BXJSaveButton *saveBtn = [[BXJSaveButton alloc] initWithFrame:CGRectMake( WIDTH - 60 - 10,20, 60, 64)];
        [topBackBtnView addSubview:saveBtn];
        [saveBtn addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + 10, WIDTH, 135)];
        [self addSubview:self.contentView];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(12, 12, WIDTH - 24, 120)];
        [self.contentView addSubview:self.textView];
        self.textView.backgroundColor = [UIColor whiteColor];
        self.textView.delegate = self;
        
        self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 6, 150, 19)];
        self.placeholderLabel.font = [UIFont systemFontOfSize:17];
        self.placeholderLabel.textColor = UIColorFromRGB(0x878787);
        [self.textView addSubview:self.placeholderLabel];
        self.placeholderLabel.text = @"请输入个性签名";
        self.placeholderLabel.textAlignment = NSTextAlignmentLeft;
        self.textView.font = [UIFont systemFontOfSize:17];
//        self.placeholderLabel.backgroundColor = [UIColor greenColor];
        
        
    }
    return self;
}

-(void)saveAction:(id)sender
{
    if (_saveSignatureAction) {
        _saveSignatureAction(self.textView.text,NO);
        
        [UIView  animateWithDuration:0.3 animations:^{
            
            self.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
            
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
            
        }];
    }
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        self.placeholderLabel.text = @"请输入个性签名";
    }else{
        self.placeholderLabel.text = @"";
    }
}

@end

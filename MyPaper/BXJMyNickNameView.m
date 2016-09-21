//
//  MyNickNameView.m
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMyNickNameView.h"
#import "TopWithBackbtnView.h"
#import "BXJSaveButton.h"

#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJMyNickNameView ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation BXJMyNickNameView

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
                
                if (_saveNickNameAction) {
                    _saveNickNameAction(nil,NO);
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
        titleLabel.text = @"昵称";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        BXJSaveButton *saveBtn = [[BXJSaveButton alloc] initWithFrame:CGRectMake( WIDTH - 60 - 10,20, 60, 64)];
        [topBackBtnView addSubview:saveBtn];
        [saveBtn addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 64 + 10, WIDTH, 44)];
        [self addSubview:self.textField];
        self.textField.backgroundColor = [UIColor whiteColor];
        self.textField.layer.shadowColor=[[UIColor blackColor] CGColor];
        self.textField.layer.shadowOffset=CGSizeMake(0, 1);
        self.textField.layer.shadowRadius=1;
        self.textField.layer.shadowOpacity=0.1;
        
        [self.textField setLeftView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 44)]];
        self.textField.leftViewMode = UITextFieldViewModeAlways;
        self.textField.clearButtonMode = UITextFieldViewModeAlways;
        
    }
    return self;
}


-(void)saveAction:(id)sender
{
    if (_saveNickNameAction) {
        _saveNickNameAction(self.textField.text,NO);
        
        [UIView  animateWithDuration:0.3 animations:^{
            
            self.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
            
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
            
        }];
    }
}


@end

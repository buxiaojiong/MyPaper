//
//  MyPageButton.m
//  MyPaper
//
//  Created by jojojiong on 16/7/21.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMyPageButton.h"

#import <Masonry.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJMyPageButton ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *Label1;
@property (nonatomic, strong) UILabel *Label2;

@end

@implementation BXJMyPageButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView  = [[UIView alloc] init];
//        self.contentView.backgroundColor = [UIColor redColor];
        [self addSubview:self.contentView];
        
        
        self.Label1 = [[UILabel alloc] init];
        self.Label1.font = [UIFont systemFontOfSize:13];
        self.Label1.textColor = UIColorFromRGB(0x878787);
        self.Label1.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.Label1];
        
        self.Label2 = [[UILabel alloc] init];
        self.Label2.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.Label2];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    self.leftLabel.frame = CGRectMake(0, 0, <#CGFloat width#>, self.frame.size.height);
    
    
//    self.contentView.center = self.center;
}

- (void)setLeftLabelWithText:(NSString *)text andRightLabelWithNumber:(NSString *)number
{
    self.Label1.text = text;
    self.Label1.frame = CGRectMake(0, 0, 0, 0);
    [self.Label1 sizeToFit];
    
    self.Label2.text = number;
    self.Label2.frame = CGRectMake(self.Label1.frame.size.width + 20, 0, 0, 0);
    [self.Label2 sizeToFit];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(CGRectGetMaxX(self.Label2.frame));
        make.height.mas_equalTo(self.Label1.frame.size.height);
        make.center.mas_equalTo(self.center);
    }];
    
}

//
//- (void)SetUpLabelWithNumber:(NSString *)number andDownLabelWithText:(NSString *)test
//{
//    self.Label2.text = number;
//    self.Label2.frame = CGRectMake(0, 0, 0, 0);
//    [self.Label2 sizeToFit];
//    
//    self.Label1.text = test;
//    self.Label1.frame = CGRectMake(0, self.Label2.frame.size.height + 16, 0, 0);
//    self.Label2.center = self.contentView.center;
//    [self.Label1 sizeToFit];
//    
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(CGRectGetMaxX(self.Label2.frame));
//        make.height.mas_equalTo(CGRectGetMaxY(self.Label1.frame));
//        make.center.mas_equalTo(self.center);
//    }];
//}

@end

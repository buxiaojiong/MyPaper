//
//  MyPageBtnTwo.m
//  MyPaper
//
//  Created by jojojiong on 16/7/21.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMyPageBtnTwo.h"
#import <Masonry.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface BXJMyPageBtnTwo ()

@property (nonatomic, strong) UILabel *Label1;
@property (nonatomic, strong) UILabel *Label2;

@end

@implementation BXJMyPageBtnTwo

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.Label1 = [[UILabel alloc] init];
        self.Label1.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.Label1];
        
        self.Label2 = [[UILabel alloc] init];
        self.Label2.font = [UIFont systemFontOfSize:13];
        self.Label2.textColor = UIColorFromRGB(0x878787);
        self.Label2.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.Label2];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //    self.leftLabel.frame = CGRectMake(0, 0, <#CGFloat width#>, self.frame.size.height);
    
    
    //    self.contentView.center = self.center;
}


- (void)SetUpLabelWithNumber:(NSString *)number andDownLabelWithText:(NSString *)test
{
    self.Label1.text = number;
    [self.Label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.centerX.equalTo(self);
    }];
    [self.Label1 sizeToFit];
    
    self.Label2.text = test;
    [self.Label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Label1.mas_bottom).offset(8);
        make.centerX.equalTo(self);
    }];
    [self.Label1 sizeToFit];
    
  
}

@end

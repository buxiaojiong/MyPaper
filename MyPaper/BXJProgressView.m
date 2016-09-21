//
//  ProgressView.m
//  CALayer
//
//  Created by sourcecode on 16/2/16.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJProgressView.h"
#import <Masonry.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJProgressView ()

@property (nonatomic, strong) CALayer *progressLayer;
@property (nonatomic, assign) CGFloat currentViewWidth;

//@property (nonatomic, strong) UIView *progressLayer;

@end

@implementation BXJProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xcdcdcd);
        self.layer.cornerRadius = 6;
        
        self.progressLayer = [CALayer layer];
        self.progressLayer.cornerRadius = 6;
        self.progressLayer.frame = CGRectMake(0, 0, 0, frame.size.height);
        [self.layer addSublayer:self.progressLayer];
        self.progressLayer.backgroundColor = UIColorFromRGB(0xfe3e6f).CGColor;
        self.currentViewWidth = frame.size.width;
        
//        self.progressLayer = [[UIView alloc] init];
//        [self addSubview:self.progressLayer];
//        [self.progressLayer mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.bottom.equalTo(self);
//            make.width.mas_equalTo(self);
//        }];
//        self.progressLayer.layer.cornerRadius = 6;
//        self.progressLayer.backgroundColor = UIColorFromRGB(0xfe3e6f);
        
        self.leverLabel = [[UILabel alloc] init];
        [self addSubview:self.leverLabel];
        [self.leverLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.height.mas_equalTo(12);
            
        }];
        self.leverLabel.font = [UIFont systemFontOfSize:10];
        self.leverLabel.textColor = UIColorFromRGB(0xffffff);
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    self.currentViewWidth = self.frame.size.width;
//    
//    [self.progressLayer mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.bottom.equalTo(self);
//        make.width.mas_equalTo(self.progress *self.currentViewWidth);
//    }];
}

- (void)setProgress:(CGFloat)progress
{
//     [self setNeedsLayout];
//    [self layoutIfNeeded];
    if (progress <= 0) {
        self.progressLayer.frame = CGRectMake(0, 0, 0, self.frame.size.height);
//        [self.progressLayer mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.bottom.equalTo(self);
//            make.width.mas_equalTo(self);
//        }];
        
    }else if (progress <= 1){
        self.progressLayer.frame = CGRectMake(0, 0, progress *self.currentViewWidth, self.frame.size.height);
        
//        [self.progressLayer mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.bottom.equalTo(self);
//            make.width.mas_equalTo(progress *self.currentViewWidth);
//        }];
    }else{
        self.progressLayer.frame = CGRectMake(0, 0, self.currentViewWidth, self.frame.size.height);
//        [self.progressLayer mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.bottom.equalTo(self);
//            make.width.mas_equalTo(self.frame.size.width);
//        }];
    }

}

- (void)setLayerColor:(UIColor *)layerColor
{
    self.progressLayer.backgroundColor = layerColor.CGColor;
}

@end

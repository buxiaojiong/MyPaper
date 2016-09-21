//
//  ProgressView.h
//  CALayer
//
//  Created by sourcecode on 16/2/16.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BXJProgressView : UIView

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) UIColor *layerColor;

//@property (nonatomic, assign) double nowLever;
//@property (nonatomic, assign) double maxLever;
@property (nonatomic, strong) UILabel *leverLabel;

@end

//
//  BXJChoiceSettingCell.m
//  MyPaper
//
//  Created by sourcecode on 16/8/1.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJChoiceSettingCell.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define WIDTH [UIScreen mainScreen ].bounds.size.width

@interface BXJChoiceSettingCell ()

@property (nonatomic, strong) UIImageView *rangeImage;
@property (nonatomic, strong) UIView *rangeView;
@property (nonatomic, strong) UIView *rangeSecondView;
@property (nonatomic, strong) UILabel *rangeLabel;

@end

@implementation BXJChoiceSettingCell

- (void)awakeFromNib
{
    self.slider.delegate = self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"BXJChoiceSettingCell";
    BXJChoiceSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[BXJChoiceSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 24, 63, 16)];
        [self.contentView addSubview:self.firstLabel];
        self.firstLabel.textColor = UIColorFromRGB(0x878787);
        self.firstLabel.font = [UIFont systemFontOfSize:15];
        
        self.secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 103 - 20 - 16, 63, 16)];
        [self.contentView addSubview:self.secondLabel];
        self.secondLabel.textColor = UIColorFromRGB(0x878787);
        self.secondLabel.font = [UIFont systemFontOfSize:15];
        
        UIButton *reduceSliderBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.firstLabel.frame) + 15, self.firstLabel.center.y - 8, 16, 16)];
        [self.contentView addSubview:reduceSliderBtn];
        [reduceSliderBtn setImage:[UIImage imageNamed:@"reduceBtn"] forState:UIControlStateNormal];
        [reduceSliderBtn addTarget:self action:@selector(reduceSliderPressed) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *addSliderBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH - 30 - 16, self.firstLabel.center.y - 8, 16, 16)];
        [self.contentView addSubview:addSliderBtn];
        [addSliderBtn setImage:[UIImage imageNamed:@"addBtn"] forState:UIControlStateNormal];
        [addSliderBtn addTarget:self action:@selector(addSliderPressed) forControlEvents:UIControlEventTouchUpInside];
        
        
        self.slider = [[ASValueTrackingSlider alloc] initWithFrame:CGRectMake(CGRectGetMaxX(reduceSliderBtn.frame) + 10, self.firstLabel.center.y - 10 , WIDTH - (CGRectGetMaxX(reduceSliderBtn.frame) + 10) - 30 - 16 - 10, 20)];
        [self.contentView addSubview:self.slider];
        self.slider.delegate = self;
        self.slider.popUpViewCornerRadius = 2.0;
        [self.slider setMaxFractionDigitsDisplayed:0];
        self.slider.popUpViewColor = UIColorFromRGB(0xfe3e6f);
        self.slider.font = [UIFont systemFontOfSize:12];
        self.slider.textColor = [UIColor whiteColor];
        self.slider.popUpViewWidthPaddingFactor = 1.5;
        self.slider.popUpViewArrowLength = 6;
        self.slider.minimumTrackTintColor = UIColorFromRGB(0xfe3e6f);
        self.slider.maximumTrackTintColor = UIColorFromRGB(0xd6d6d6);
        [self.slider showPopUpViewAnimated:YES];
        [self.slider setThumbImage:[UIImage imageNamed:@"sliderButton"] forState:UIControlStateNormal];
        [self.slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
        
        UIButton *reduceRangeBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.secondLabel.frame) + 15, self.secondLabel.center.y - 8, 16, 16)];
        [self.contentView addSubview:reduceRangeBtn];
        [reduceRangeBtn setImage:[UIImage imageNamed:@"reduceBtn"] forState:UIControlStateNormal];
        [reduceRangeBtn addTarget:self action:@selector(reduceRange) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *addRangeBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH - 30 - 16, self.secondLabel.center.y - 8, 16, 16)];
        [self.contentView addSubview:addRangeBtn];
        [addRangeBtn setImage:[UIImage imageNamed:@"addBtn"] forState:UIControlStateNormal];
        [addRangeBtn addTarget:self action:@selector(addRange) forControlEvents:UIControlEventTouchUpInside];
        
        self.rangeView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(reduceRangeBtn.frame) + 10, self.secondLabel.center.y - 10 , WIDTH - (CGRectGetMaxX(reduceRangeBtn.frame) + 10) - 30 - 16 - 10, 20)];
        [self.contentView addSubview:self.rangeView];
//        self.rangeView.backgroundColor = [UIColor redColor];
    
        
        self.rangeSecondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
        [self.rangeView addSubview:self.rangeSecondView];
        self.rangeSecondView.center = CGPointMake(self.rangeView.frame.size.width/2, self.rangeView.frame.size.height/2);
//        self.rangeSecondView.backgroundColor = [UIColor yellowColor];
        
        self.rangeImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.rangeSecondView.frame.size.height/2 - 4.5, 9, 9)];
        
        self.rangeImage.image = [UIImage imageNamed:@"addReduce"];
        [self.rangeSecondView addSubview:self.rangeImage];
        
        
        self.rangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 , self.rangeSecondView.frame.size.height/2 - 8, 50,16)];
        [self.rangeSecondView addSubview:self.rangeLabel];
//        self.rangeLabel.backgroundColor = [UIColor blueColor];
        self.rangeLabel.textColor = UIColorFromRGB(0xfe3e6f);
        self.rangeLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return self;
}

- (void)reduceSliderPressed
{
    
    if (_reduceSliderValueAction) {
        _reduceSliderValueAction();
    }
//    float value = self.slider.value - 1.f;
//    
//    [self.slider setValue:value animated:YES];
}

- (void)addSliderPressed
{
    if (_addSliderValueAction) {
        _addSliderValueAction();
    }
    
//    float value = self.slider.value + 1.f;
//    
//    [self.slider setValue:value animated:YES];
}

- (void)sliderAction:(ASValueTrackingSlider *)slider {
    
    
    NSString *valueStr = [slider.numberFormatter stringFromNumber:@(slider.value)];
    
    float value = [valueStr floatValue];
    
    NSLog(@"%.f",value);
    
    if (_sliderChangeAction) {
        _sliderChangeAction(value);
    }
    
}

- (void)sliderWillDisplayPopUpView:(ASValueTrackingSlider *)slider;
{
    [self.superview bringSubviewToFront:self];
}

//- (NSString *)slider:(ASValueTrackingSlider *)slider stringForValue:(float)value
//{
//    NSString *ss = [NSString stringWithFormat:@"%@", [slider.numberFormatter stringFromNumber:@(value)]];
//    
//    
//    return ss;
//}

- (void)setRangeText:(NSString *)rangeText{
    _rangeText = rangeText;
    
    self.rangeLabel.text = _rangeText;
    [self.rangeLabel sizeToFit];
    self.rangeSecondView.bounds = CGRectMake(0, 0, 9+self.rangeLabel.bounds.size.width, 20);
    self.rangeSecondView.center = CGPointMake(self.rangeView.frame.size.width/2, self.rangeView.frame.size.height/2);
    
}

- (void)reduceRange
{
    if (_reduceRangeAction) {
        _reduceRangeAction();
    }
}

- (void)addRange
{
    if (_addRangeAction) {
        _addRangeAction();
    }
}

@end

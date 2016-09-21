//
//  BXJChoiceSettingCell.h
//  MyPaper
//
//  Created by sourcecode on 16/8/1.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASValueTrackingSlider.h"

@interface BXJChoiceSettingCell : UITableViewCell
<ASValueTrackingSliderDelegate>

@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UILabel *secondLabel;
@property (strong, nonatomic) ASValueTrackingSlider *slider;
@property (nonatomic, strong) NSString *rangeText;

@property(nonatomic)void (^reduceRangeAction)();
@property(nonatomic)void (^addRangeAction)();

@property(nonatomic)void (^sliderChangeAction)(float value);

@property(nonatomic)void (^reduceSliderValueAction)();
@property(nonatomic)void (^addSliderValueAction)();

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

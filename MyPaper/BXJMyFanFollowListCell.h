//
//  MyFanFollowListCell.h
//  MyPaper
//
//  Created by sourcecode on 16/7/25.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BXJMyFanStatus;

@interface BXJMyFanFollowListCell : UITableViewCell

@property (nonatomic, strong) BXJMyFanStatus *myFanStatus;
@property(nonatomic)void (^followOrCancleAction)(UIButton *sender);

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

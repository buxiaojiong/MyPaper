//
//  MyPageCell.h
//  MyPaper
//
//  Created by sourcecode on 16/7/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BXJMyPageCell : UITableViewCell

@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UILabel *titleLabel;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

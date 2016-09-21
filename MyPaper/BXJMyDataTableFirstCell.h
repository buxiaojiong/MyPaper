//
//  MyDataTableFirstCell.h
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BXJMyDataTableFirstCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *userImageView;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

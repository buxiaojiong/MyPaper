//
//  MyPageCell.m
//  MyPaper
//
//  Created by sourcecode on 16/7/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMyPageCell.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define WIDTH [UIScreen mainScreen ].bounds.size.width

@implementation BXJMyPageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"MyPageViewCell";
    BXJMyPageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[BXJMyPageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *accessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 14)];
        accessoryView.image = [UIImage imageNamed:@"accessoryView"];
        self.accessoryView = accessoryView;
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 44, WIDTH, 1)];
        line.backgroundColor = UIColorFromRGB(0xededed);
        [self addSubview:line];
        
        self.titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 12, 22, 22)];
        [self addSubview:self.titleImageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(58, 15, 100, 16)];
        [self addSubview:self.titleLabel];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = UIColorFromRGB(0x2b2b2b);
        
    }
    return self;
}

@end

//
//  MyDataTableFirstCell.m
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMyDataTableFirstCell.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define WIDTH [UIScreen mainScreen ].bounds.size.width

@implementation BXJMyDataTableFirstCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"BXJMyDataTableFirstCell";
    BXJMyDataTableFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[BXJMyDataTableFirstCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 70, WIDTH, 1)];
        line.backgroundColor = UIColorFromRGB(0xededed);
        [self addSubview:line];
        
        self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 50 - 10 - 8 - 20, 10, 50, 50)];
        [self addSubview:self.userImageView];
        self.userImageView.backgroundColor = [UIColor redColor];
//        self.userImageView.layer.masksToBounds = YES;
//        self.userImageView.layer.cornerRadius = 25.0;
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(14, 27, 100, 16)];
        [self addSubview:self.titleLabel];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = UIColorFromRGB(0x2b2b2b);
        
        
    }
    return self;
}

@end

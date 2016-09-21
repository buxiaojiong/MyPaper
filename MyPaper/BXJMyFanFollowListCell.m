//
//  MyFanFollowListCell.m
//  MyPaper
//
//  Created by sourcecode on 16/7/25.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMyFanFollowListCell.h"
#import "BXJMyFanStatus.h"

#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJMyFanFollowListCell ()

@property (nonatomic, strong) UIImageView *headView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *levelLabel;
@property (nonatomic, strong) UILabel *levelNameLabel;
@property (nonatomic, strong) UILabel *signLabel;

@property (nonatomic, strong) UIButton *followBtn;

@end

@implementation BXJMyFanFollowListCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"BXJMyFanFollowListCell";
    BXJMyFanFollowListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[BXJMyFanFollowListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.headView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 11.5, 50, 50)];
        self.headView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.headView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(74, 9, WIDTH - 74 - 76, 16)];
//        self.nameLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:self.nameLabel];
        self.nameLabel.font = [UIFont systemFontOfSize:15];
        self.nameLabel.textColor = UIColorFromRGB(0x2b2b2b);
        
        self.levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(74, 9+16+6, 45, 13)];
//        self.levelLabel.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.levelLabel];
        self.levelLabel.font = [UIFont systemFontOfSize:12];
        self.levelLabel.textColor = UIColorFromRGB(0xfe3e6f);

        
        self.levelNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(74 + 45, 9 +16 + 6, WIDTH - 74 - 76 - 45, 13)];
//        self.levelNameLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.levelNameLabel];
        self.levelNameLabel.font = [UIFont systemFontOfSize:12];
        self.levelNameLabel.textColor = UIColorFromRGB(0xfe3e6f);
        
        
        self.signLabel = [[UILabel alloc] initWithFrame:CGRectMake(74, 9+16+6+13+6, WIDTH - 74 - 76, 13)];
        [self.contentView addSubview:self.signLabel];
//        self.signLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:self.signLabel];
        self.signLabel.font = [UIFont systemFontOfSize:12];
        self.signLabel.textColor = UIColorFromRGB(0x2b2b2b);
        
        
        self.followBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH - 12- 52, 25, 52, 22)];
        [self.contentView addSubview:self.followBtn];
//        self.followBtn.backgroundColor = [UIColor redColor];
        [self.followBtn.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
        [self.followBtn.layer setBorderWidth:1.0]; //边框宽度
        [self.followBtn.layer setBorderColor:UIColorFromRGB(0xfe3e6f).CGColor];//边框颜色
        [self.followBtn setTitleColor:UIColorFromRGB(0xfe3e6f) forState:UIControlStateNormal];
        [self.followBtn setTitleColor:UIColorFromRGB(0xfe3e6f) forState:UIControlStateSelected];
        [self.followBtn setTitle:@"取消关注" forState:UIControlStateSelected];
        [self.followBtn setTitle:@"+ 关注" forState:UIControlStateNormal];
        self.followBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.followBtn addTarget:self action:@selector(followOrCancleBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 72, WIDTH, 1)];
        line.backgroundColor = UIColorFromRGB(0xededed);
        [self addSubview:line];
        
    }
    return self;
}

- (void)setMyFanStatus:(BXJMyFanStatus *)myFanStatus
{
    _myFanStatus = myFanStatus;
    self.nameLabel.text = self.myFanStatus.name;
    self.levelLabel.text = self.myFanStatus.lever;
    self.levelNameLabel.text = self.myFanStatus.leverName;
    self.signLabel.text = self.myFanStatus.sign;
    
    CGSize levelLabelMaxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    CGRect levelLabelSize = [self.levelLabel.text boundingRectWithSize:levelLabelMaxSize
                                                                options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}
                                                                context:nil];
    self.levelLabel.frame =  (CGRect){{74, 9+16+6}, levelLabelSize.size};
    
//    [self.levelLabel sizeToFit];
    
    self.levelNameLabel.frame = CGRectMake(CGRectGetMaxX(self.levelLabel.frame)+5, 9 +16 + 6, WIDTH - 74 - 76 - 45, 13);
    
    if (self.myFanStatus.isFollowed) {
        self.followBtn.selected = YES;
    }else{
        self.followBtn.selected = NO;
    }
    
}

- (void)followOrCancleBtn:(UIButton *)sender
{
    
    if (_followOrCancleAction) {
        _followOrCancleAction(sender);
    }
    
}

@end

//
//  MyPageHeadView.m
//  MyPaper
//
//  Created by sourcecode on 16/7/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMyPageHeadView.h"
#import <Masonry.h>
#import "BXJMyStatus.h"

#import "BXJMyPageButton.h"
#import "BXJMyPageBtnTwo.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define WIDTH [UIScreen mainScreen ].bounds.size.width

@interface BXJMyPageHeadView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *sexImageView;
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *midCenterLine;
@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, strong) BXJMyPageButton *zanCountBtn;
@property (nonatomic, strong) BXJMyPageButton *caiCountBtn;

@property (nonatomic, strong) BXJMyPageBtnTwo *followCountBtn;
@property (nonatomic, strong) BXJMyPageBtnTwo *fanCountBtn;
@property (nonatomic, strong) BXJMyPageBtnTwo *postCountBtn;



@end

@implementation BXJMyPageHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
        
        self.contentView = [[UIView alloc] init];
        [self addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-1);
            make.left.right.equalTo(self);
        }];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.layer.shadowColor=[[UIColor blackColor] CGColor];
        self.contentView.layer.shadowOffset=CGSizeMake(0, 1);
        self.contentView.layer.shadowRadius=1;
        self.contentView.layer.shadowOpacity=0.1;
        
        self.nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.nameLabel];
        self.nameLabel.font = [UIFont systemFontOfSize:15];
        self.nameLabel.textColor = UIColorFromRGB(0x2b2b2b);
        
        self.sexImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.sexImageView];
        

        
        self.progressView = [[BXJProgressView alloc] initWithFrame:CGRectMake(44, 40, (WIDTH - 88)*0.6, 17)];
        [self.contentView addSubview:self.progressView];
        
//        [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.nameLabel.mas_bottom).offset(12);
//            make.left.equalTo(self.contentView).offset(44);
//            make.height.mas_equalTo(17);
//            make.width.equalTo(self.contentView.mas_width).multipliedBy(0.5);
//        }];
        
        self.levelLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.levelLabel];
        self.levelLabel.font = [UIFont systemFontOfSize:12];
        self.levelLabel.textColor = UIColorFromRGB(0xfe3e6f);
        
        self.levelName = [[UILabel alloc] init];
        [self.contentView addSubview:self.levelName];
        self.levelName.font = [UIFont systemFontOfSize:12];
        self.levelName.textColor = UIColorFromRGB(0xfe3e6f);
        
        self.topLine = [[UIView alloc] init];
        [self.contentView addSubview:self.topLine];
        self.topLine.backgroundColor = UIColorFromRGB(0xededed);
        
        self.midCenterLine = [[UIView alloc] init];
        [self.contentView addSubview:self.midCenterLine];
        self.midCenterLine.backgroundColor = UIColorFromRGB(0xededed);
        
        self.bottomLine = [[UIView alloc] init];
        [self.contentView addSubview:self.bottomLine];
        self.bottomLine.backgroundColor = UIColorFromRGB(0xededed);
        
        self.zanCountBtn = [[BXJMyPageButton alloc] init];
        [self.contentView addSubview:self.zanCountBtn];
        
        self.caiCountBtn = [[BXJMyPageButton alloc] init];
        [self.contentView addSubview:self.caiCountBtn];
        
        self.followCountBtn = [[BXJMyPageBtnTwo alloc] init];
        [self.contentView addSubview:self.followCountBtn];
        
        self.fanCountBtn = [[BXJMyPageBtnTwo alloc] init];
        [self.contentView addSubview:self.fanCountBtn];
        
        self.postCountBtn = [[BXJMyPageBtnTwo alloc] init];
        [self.contentView addSubview:self.postCountBtn];
        
        UIView *lastSpaceView = [UIView new];
//        lastSpaceView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:lastSpaceView];
        
        [lastSpaceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.bottomLine);
            make.bottom.equalTo(self.contentView);
        }];
        
        
        
        for (NSInteger i = 0; i < 3; i++) {
            
            BXJMyPageBtnTwo *pagebutton = [self getPageButton:i];
            
            [pagebutton mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(self.bottomLine).offset(19);
                make.width.mas_equalTo(50);
                make.height.mas_equalTo(56);
                make.left.equalTo(lastSpaceView.mas_right);
//                make.centerX.equalTo(self.contentView.mas_right).multipliedBy(((CGFloat)i + 1) / ((CGFloat)3 + 1));
                
            }];
            
            UIView *spaceView = [UIView new];
//            spaceView.backgroundColor = [UIColor greenColor];
            [self.contentView addSubview:spaceView];
            
            [spaceView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(pagebutton.mas_right).with.priorityHigh();
                make.top.equalTo(self.bottomLine);
                make.bottom.equalTo(self.contentView);
                make.width.equalTo(lastSpaceView.mas_width);
                
            }];
            
            lastSpaceView = spaceView;
            
        }
        
        [lastSpaceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right);
        }];
        
        
        self.zanCountBtn.tag = MyPageMenuZanCount;
        self.caiCountBtn.tag = MyPageMenuCaiCount;
        self.followCountBtn.tag = MyPageMenuFollowCount;
        self.fanCountBtn.tag = MyPageMenuFanCount;
        self.postCountBtn.tag = MyPageMenuPostCount;
        
        [self.zanCountBtn addTarget:self action:@selector(BrnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.caiCountBtn addTarget:self action:@selector(BrnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.followCountBtn addTarget:self action:@selector(BrnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.fanCountBtn addTarget:self action:@selector(BrnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.postCountBtn addTarget:self action:@selector(BrnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return self;
}

-(void)BrnAction:(id)sender
{
    UIButton *button = sender;
    
    if (_RetureMyaction) {

        _RetureMyaction(button.tag);
    }
}

- (void)setMyData:(BXJMyStatus *)data;
{
    self.nameLabel.text = data.myName;
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(44);
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.height.mas_equalTo(14);
      
    }];
    
    [self.sexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(10);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
        make.width.height.mas_equalTo(15);
        make.right.lessThanOrEqualTo(self.contentView.mas_right).with.offset(-44);
    }];
    
    switch (data.sex) {
        case FeMale:
            self.sexImageView.image = [UIImage imageNamed:@"female"];
            break;
            
        case Male:
            self.sexImageView.image = [UIImage imageNamed:@"male"];
            break;
    }
    
    //设置label1的content hugging 为1000
    [self.sexImageView setContentHuggingPriority:UILayoutPriorityRequired
                                         forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置label1的content compression 为1000
    [self.sexImageView setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                       forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置右边的label2的content hugging 为1000
    [self.nameLabel setContentHuggingPriority:UILayoutPriorityRequired
                                      forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置右边的label2的content compression 为250
    [self.nameLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                                    forAxis:UILayoutConstraintAxisHorizontal];

//    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.nameLabel.mas_bottom).offset(12);
//        make.left.equalTo(self.contentView).offset(44);
//        make.height.mas_equalTo(17);
//        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.5);
//    }];
//    [self.progressView layoutIfNeeded];
    
    self.progressView.progress = (CGFloat)((CGFloat)data.nowLevel / (CGFloat)data.maxLevel);
    
    NSString *levelText = [NSString stringWithFormat:@"%ld/%ld",(long)data.nowLevel,(long)data.maxLevel];
    self.progressView.leverLabel.text = levelText;
    
    NSString *level = [NSString stringWithFormat:@"LV.%@",data.level];
    self.levelLabel.text = level;
    [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.progressView.mas_right).offset(14);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(12);
        make.height.mas_equalTo(14);
    }];
    
    self.levelName.text = data.levelName;
    [self.levelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.levelLabel.mas_right).offset(10);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(12);
        make.height.mas_equalTo(14);
    }];
    
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.progressView.mas_bottom).offset(11.5);
        make.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
    [self.midCenterLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.topLine.mas_bottom).offset(12);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(1);
    }];
    
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.midCenterLine.mas_bottom).offset(12);
        make.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
    [self.zanCountBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.top.equalTo(self.topLine);
        make.bottom.equalTo(self.bottomLine);
        make.right.equalTo(self.midCenterLine);
    }];
    
    NSString *zanCount = [NSString stringWithFormat:@"%.f",data.zanCount];
    [self.zanCountBtn setLeftLabelWithText:@"被赞次数" andRightLabelWithNumber:zanCount];

    [self.caiCountBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.midCenterLine);
        make.top.equalTo(self.topLine);
        make.bottom.equalTo(self.bottomLine);
        make.right.equalTo(self.contentView);
    }];
    
    NSString *caiCount = [NSString stringWithFormat:@"%.f",data.caiCount];
    [self.caiCountBtn setLeftLabelWithText:@"被虐次数" andRightLabelWithNumber:caiCount];
    
    NSString *followCount = [NSString stringWithFormat:@"%.f",data.followCount];
    [self.followCountBtn SetUpLabelWithNumber:followCount andDownLabelWithText:@"关注"];
    
    NSString *fanCount = [NSString stringWithFormat:@"%.f",data.fanCount];
    [self.fanCountBtn SetUpLabelWithNumber:fanCount andDownLabelWithText:@"粉丝"];
    
    NSString *postCount = [NSString stringWithFormat:@"%.f",data.postCount];
    [self.postCountBtn SetUpLabelWithNumber:postCount andDownLabelWithText:@"帖子"];
    
    
//    UIView *lastSpaceView = [UIView new];
//    lastSpaceView
//    
//    for (NSInteger i = 0; i < 3; i++) {
//        
//        MyPageBtnTwo *pagebutton = [self getPageButton:i];
//        
//        [pagebutton mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.top.equalTo(self.bottomLine).offset(19);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(56);
//            make.centerX.equalTo(self.contentView.mas_right).multipliedBy(((CGFloat)i + 1) / ((CGFloat)3 + 1));
//            
//        }];
//        
//    }
 
    

    

}

- (BXJMyPageBtnTwo *)getPageButton:(NSInteger)index
{
    BXJMyPageBtnTwo *pagebutton;
    if (index == 0) {
        pagebutton = self.followCountBtn;
    }else if (index == 1){
        pagebutton = self.fanCountBtn;
    }else{
        pagebutton = self.postCountBtn;
    }
    
    return pagebutton;
}

@end

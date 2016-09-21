//
//  BXJSettingView.m
//  MyPaper
//
//  Created by sourcecode on 16/7/27.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJSettingView.h"
#import "TopWithBackbtnView.h"
#import <Masonry.h>
#import "BXJAccountManagerView.h"
#import "BXJAboutusView.h"
#import "BXJFeedBackView.h"

#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface BXJSettingView ()

<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, assign) BOOL isJump;

@property (nonatomic, strong) BXJAccountManagerView *accountManagerView;
@property (nonatomic, strong) BXJAboutusView *aboutusView;
@property (nonatomic, strong) BXJFeedBackView *feedBackView;

@end

@implementation BXJSettingView

- (instancetype)initWithFrame:(CGRect)frame withnav:(UINavigationController *)nav
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
        
        TopWithBackbtnView *topBackBtnView = [[TopWithBackbtnView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
        [self addSubview:topBackBtnView];
        topBackBtnView.BackNacAction = ^(){
   
            [nav popViewControllerAnimated:YES];
            
        };
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 80, 44)];
        [topBackBtnView addSubview:titleLabel];
        
        CGPoint center = CGPointMake(WIDTH/2, topBackBtnView.center.y+10);
        titleLabel.center = center;
        titleLabel.font = [UIFont systemFontOfSize:17];
        titleLabel.textColor = UIColorFromRGB(0x2b2b2b);
        titleLabel.text = @"设置";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-74)];
        [self addSubview:self.tableView];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self insertSubview:self.tableView belowSubview:topBackBtnView];
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 10)];
        headView.backgroundColor = [UIColor clearColor];
        [self.tableView setTableHeaderView:headView];
        
        UIView *signOutButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 90)];
        UIView *footerLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
        footerLine.backgroundColor = UIColorFromRGB(0xbdbdbd);
        footerLine.layer.shadowColor=[[UIColor blackColor] CGColor];
        footerLine.layer.shadowOffset=CGSizeMake(0, 1);
        footerLine.layer.shadowRadius=1;
        footerLine.layer.shadowOpacity=0.1;
        [signOutButtonView addSubview:footerLine];
        
        UIButton *signOutButton = [[UIButton alloc] init];
        [signOutButtonView addSubview:signOutButton];
        [signOutButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(signOutButtonView).offset(20);
            make.left.equalTo(signOutButtonView);
            make.right.equalTo(signOutButtonView);
            make.height.mas_equalTo(50);
        }];
        signOutButton.backgroundColor = [UIColor whiteColor];
        [signOutButton setTitle:@"退出登陆" forState:UIControlStateNormal];
        [signOutButton setTitleColor:UIColorFromRGB(0xfe3e6f) forState:UIControlStateNormal];
        [signOutButton addTarget:self action:@selector(signOutButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *bottonLine = [[UIView alloc] initWithFrame:CGRectMake(0, 70, WIDTH, 1)];
        bottonLine.backgroundColor = UIColorFromRGB(0xbdbdbd);
        bottonLine.layer.shadowColor=[[UIColor blackColor] CGColor];
        bottonLine.layer.shadowOffset=CGSizeMake(0, 1);
        bottonLine.layer.shadowRadius=1;
        bottonLine.layer.shadowOpacity=0.1;
        [signOutButtonView addSubview:bottonLine];
        
        [self.tableView setTableFooterView:signOutButtonView];
        
        self.titleArray = @[@"账号管理",@"黑名单管理",@"清空内存",@"反馈",@"关于我们"];
        
        self.isJump = NO;
        
    }
    return self;
}

- (void)signOutButtonPressed
{
    if (_SignOutAction) {
        _SignOutAction(YES);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIdentifier = @"MyPageSettingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 44, WIDTH, 1)];
        line.backgroundColor = UIColorFromRGB(0xededed);
        [cell.contentView addSubview:line];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIImageView *accessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 14)];
    accessoryView.image = [UIImage imageNamed:@"accessoryView"];
    cell.accessoryView = accessoryView;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isJump) {
        return;
    }
    
    self.isJump = YES;
    
    __weak BXJSettingView *weakSelf = self;
    
    if (indexPath.row == MySettingMenuAccountManager) {
        
        self.accountManagerView = [[BXJAccountManagerView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
        [self addSubview:self.accountManagerView];
        
        [UIView  animateWithDuration:0.3 animations:^{
            
            self.accountManagerView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
            
        } completion:^(BOOL finished) {
            
             _isJump = NO;
            
//            self.myNickNameView.saveNickNameAction =^(NSString *nickName,BOOL isJump){
//                
//                _isJump = isJump;
//                
//                BXJMyDataTableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
//                cell.detailLabel.text = nickName;
//            };
        }];

    }else if (indexPath.row == MySettingMenuAccountBlackList){
        
        
        _isJump = NO;
    }else if (indexPath.row == MySettingMenuAccountClearMemory){
        
        
        _isJump = NO;
    }else if (indexPath.row == MySettingMenuAccountFeed){
        
        self.feedBackView = [[BXJFeedBackView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT) withnav:nil];
        [self addSubview:self.feedBackView];
        
        self.feedBackView.saveFeedbackAction = ^(NSString *signature, BOOL isJump){
            
        };
        
        [UIView  animateWithDuration:0.3 animations:^{
            
            self.feedBackView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
            
        } completion:^(BOOL finished) {
            
            _isJump = NO;
            
        }];
        
    }else{
        
        self.aboutusView = [[BXJAboutusView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT) withnav:nil];
        [self addSubview:self.aboutusView];
        
        [UIView  animateWithDuration:0.3 animations:^{
            
            self.aboutusView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
            
        } completion:^(BOOL finished) {
            
            _isJump = NO;
            
        }];
    }
}

@end

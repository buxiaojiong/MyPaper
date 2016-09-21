//
//  MyPageView.m
//  MyPaper
//
//  Created by sourcecode on 16/7/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMyPageView.h"
#import <Masonry.h>
#import "BXJMyPageCell.h"
#import "BXJMyPageHeadView.h"

#import "BXJMyStatus.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define WIDTH [UIScreen mainScreen ].bounds.size.width



@interface BXJMyPageView ()
<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleImageArray;
@property (nonatomic, strong) NSArray *titleTextArray;
@property (nonatomic, assign) MyPageSign myPageSign;

//@property (nonatomic, assign) BOOL isJump;

@end

@implementation BXJMyPageView

- (instancetype)initWithFrame:(CGRect)frame withSign:(MyPageSign)myPageSign
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
        
        self.myPageSign = myPageSign;
        
        if (myPageSign == MyPageSignIn) {
            
            [self setUpMyPageSignInView];
            
        }else{
            [self setUpMyPageSignOutView];
        }
        
    }
    return self;
}

- (void)setUpMyPageSignInView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIView *footerLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
    footerLine.backgroundColor = UIColorFromRGB(0xbdbdbd);
    footerLine.layer.shadowColor=[[UIColor blackColor] CGColor];
    footerLine.layer.shadowOffset=CGSizeMake(0, 1);
    footerLine.layer.shadowRadius=1;
    footerLine.layer.shadowOpacity=0.1;
    
    [self.tableView setTableFooterView:footerLine];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.titleImageArray = @[@[@"myData",@"collection"],@[@"comment",@"mylike",@"myZan",@"shit"],@[@"setting",@"choice"]];
    self.titleTextArray = @[@[@"我的资料",@"我的收藏"],@[@"我的评论",@"我赞的帖子",@"我赞的评论",@"我的踩"],@[ @"设置",@"精选设置"]];
    
    BXJMyPageHeadView *headView = [[BXJMyPageHeadView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 198)];
    headView.RetureMyaction=^(MyPageMenu mypageMenu)
    {
        if (_Action) {
            _Action(mypageMenu,NO);
        }
    };
    [self.tableView setTableHeaderView:headView];
    
    BXJMyStatus *myStatus = [[BXJMyStatus alloc] init];
    myStatus.myName = @"哈哈哈啊哈哈爸爸不哈哈哈啊哈哈爸爸不";
    myStatus.sex = FeMale;
    myStatus.nowLevel = 8;
    myStatus.maxLevel = 10;
    myStatus.level = @"99";
    myStatus.levelName = @"鸭全席";
    myStatus.zanCount = 999;
    myStatus.caiCount = 99999;
    myStatus.followCount = 1003;
    myStatus.fanCount = 99999;
    myStatus.postCount = 76;
    
    [headView setMyData:myStatus];
}

- (void)setUpMyPageSignOutView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIView *signInButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 90)];
    UIView *footerLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
    footerLine.backgroundColor = UIColorFromRGB(0xbdbdbd);
    footerLine.layer.shadowColor=[[UIColor blackColor] CGColor];
    footerLine.layer.shadowOffset=CGSizeMake(0, 1);
    footerLine.layer.shadowRadius=1;
    footerLine.layer.shadowOpacity=0.1;
    [signInButtonView addSubview:footerLine];
    
    UIButton *signInButton = [[UIButton alloc] init];
    [signInButtonView addSubview:signInButton];
    [signInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(signInButtonView).offset(20);
        make.left.equalTo(signInButtonView).offset(10);
        make.right.equalTo(signInButtonView).offset(-10);
        make.height.mas_equalTo(50);
    }];
    signInButton.backgroundColor = UIColorFromRGB(0xfe3e6f);
    [signInButton setTitle:@"登  录" forState:UIControlStateNormal];
    [signInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signInButton.layer setMasksToBounds:YES];
    [signInButton.layer setCornerRadius:2.0];
    [signInButton addTarget:self action:@selector(signInButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.tableView setTableFooterView:signInButtonView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.titleTextArray = @[@"精选设置",@"清空内存",@"反馈",@"关于我们"];
    
    
}

- (void)signInButtonPressed
{
    if (_SignInAction) {
        _SignInAction();
    }
}

- (void)changeToMyPageSignIn
{
    [self.tableView removeFromSuperview];
    self.tableView = nil;
    self.myPageSign = MyPageSignIn;
    
    [self setUpMyPageSignInView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.myPageSign == MyPageSignIn) {
        return 10;
    }else{
        return 0.01;
    }
    
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.myPageSign == MyPageSignIn) {
        return self.titleTextArray.count;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.myPageSign == MyPageSignIn) {
        NSArray *rowsData = self.titleTextArray[section];
        return rowsData.count;
    }else{
        return self.titleTextArray.count;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.myPageSign == MyPageSignIn) {
        
        BXJMyPageCell *cell = [BXJMyPageCell cellWithTableView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleImageView.image = [UIImage imageNamed:self.titleImageArray[indexPath.section][indexPath.row]];
        cell.titleLabel.text = self.titleTextArray[indexPath.section][indexPath.row];
        
        return cell;
        
    }else{
        
        static NSString *cellIdentifier = @"MyPageSignOutCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 44, WIDTH, 1)];
            line.backgroundColor = UIColorFromRGB(0xededed);
            [cell.contentView addSubview:line];
        }
        cell.textLabel.text = self.titleTextArray[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView *accessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 14)];
        accessoryView.image = [UIImage imageNamed:@"accessoryView"];
        cell.accessoryView = accessoryView;
        
        return cell;
    }
    
 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyPageMenu mypageMenu;
    
    if (self.myPageSign == MyPageSignIn) {
        
//        MyPageMenu mypageMenu;
        if (indexPath.section == 0 && indexPath.row == 0) {
            mypageMenu = MyPageMenuMyData;
        }else if (indexPath.section == 0 && indexPath.row == 1){
            mypageMenu = MyPageMenuMyCollection;
        }else if (indexPath.section == 1 && indexPath.row == 0){
            mypageMenu = MyPageMenuMyComment;
        }else if (indexPath.section == 1 && indexPath.row == 1){
            mypageMenu = MyPageMenuMyZanPost;
        }else if (indexPath.section == 1 && indexPath.row == 2){
            mypageMenu = MyPageMenuMyZanComment;
        }else if (indexPath.section == 1 && indexPath.row == 3){
            mypageMenu = MyPageMenuMyCai;
        }else if (indexPath.section == 2 && indexPath.row == 0){
            mypageMenu = MyPageMenuSetting;
        }else {
            mypageMenu = MyPageMenuMyChoice;
        }
        
        if (_Action) {
            _Action(mypageMenu,YES);
        }
        
    }else{
        
        if (indexPath.row == 0) {
            
            mypageMenu = MyPageMenuMyChoice;
            
        }else if (indexPath.row == 1){
            
            mypageMenu = MyPageMenuClearMemory;
            
            
        }else if (indexPath.row == 2){
            
            mypageMenu = MyPageMenuFeedback;
            
        }else{
            
             mypageMenu = MyPageMenuAboutUs;
            
        }
        
        if (_Action) {
            _Action(mypageMenu,YES);
        }
        
        
    }
    
    
 
}



@end

//
//  ViewController.m
//  MyPaper
//
//  Created by sourcecode on 16/7/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "ViewController.h"
#import "BXJMyPageView.h"
#import <Masonry.h>

#import "BXJMyDataView.h"
#import "BXJMyFollowListView.h"
#import "BXJMyFanListView.h"
#import "BXJSettingView.h"
#import "BXJChoiceSettingView.h"
#import "BXJAboutusView.h"
#import "BXJFeedBackView.h"


#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) BXJMyDataView *mydataView;
@property (nonatomic, strong) BXJMyPageView *myPageView;
@property (nonatomic, strong) BXJMyFanListView *myFanListView;
@property (nonatomic, strong) BXJMyFollowListView *myFollowListView;
@property (nonatomic, strong) BXJSettingView *mySettingView;
@property (nonatomic, strong) BXJChoiceSettingView *choiceSettingView;

@property (nonatomic, strong) BXJAboutusView *aboutusView;
@property (nonatomic, strong) BXJFeedBackView *feedBackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    self.myPageView = [[BXJMyPageView alloc] initWithFrame:CGRectZero withSign:MyPageSignout];
    [self.view addSubview:self.myPageView];
    [self.myPageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    __weak ViewController *weakSelf = self;
    
    self.myPageView.Action = ^(MyPageMenu mypageMenu, BOOL isJumps){
        
        
        
        switch (mypageMenu) {
            case MyPageMenuMyData:
            {
//                _mydataView = [[MyDataView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
                
                _mydataView = [[BXJMyDataView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) withnav:self.navigationController];
                
                UIViewController *myDataViewController = [[UIViewController alloc] init];
                [myDataViewController.view addSubview:weakSelf.mydataView];
                
                myDataViewController.automaticallyAdjustsScrollViewInsets = NO;
                
                [weakSelf.navigationController pushViewController:myDataViewController animated:YES];
                
//                [weakSelf.view addSubview:weakSelf.mydataView];
//      
//                
//                [UIView  animateWithDuration:0.3 animations:^{
//                    
//                    weakSelf.mydataView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
//                    
//                    
//                } completion:^(BOOL finished) {
//                    
//                    weakSelf.myPageView.isJump = NO;
//                    
//                }];
            }
                break;
                
            case MyPageMenuFanCount:
            {
                
                 _myFanListView = [[BXJMyFanListView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) withnav:self.navigationController];
                
                UIViewController *myFanListViewController = [[UIViewController alloc] init];
                [myFanListViewController.view addSubview:weakSelf.myFanListView];
                
                myFanListViewController.automaticallyAdjustsScrollViewInsets = NO;
                
                [weakSelf.navigationController pushViewController:myFanListViewController animated:YES];
                
            }
                
            break;
                
            case MyPageMenuFollowCount:
            {
                
                _myFollowListView = [[BXJMyFollowListView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) withnav:self.navigationController];
                
                UIViewController *myFollowListViewController = [[UIViewController alloc] init];
                [myFollowListViewController.view addSubview:weakSelf.myFollowListView];
                
                myFollowListViewController.automaticallyAdjustsScrollViewInsets = NO;
                
                [weakSelf.navigationController pushViewController:myFollowListViewController animated:YES];
                
                
            }
                
                break;
                
            case MyPageMenuSetting:
            {
                
                _mySettingView = [[BXJSettingView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) withnav:self.navigationController];
                
                weakSelf.mySettingView.SignOutAction = ^(BOOL success){
                    
#warning 退出登陆Block
                    
                };
                
                UIViewController *mySettingListViewController = [[UIViewController alloc] init];
                [mySettingListViewController.view addSubview:weakSelf.mySettingView];
                
                mySettingListViewController.automaticallyAdjustsScrollViewInsets = NO;
                
                [weakSelf.navigationController pushViewController:mySettingListViewController animated:YES];
                
                
            }
                
                break;
            case MyPageMenuMyChoice:
            {
                
                _choiceSettingView = [[BXJChoiceSettingView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) withnav:self.navigationController];
                
                
                UIViewController *choiceSettingViewController = [[UIViewController alloc] init];
                [choiceSettingViewController.view addSubview:weakSelf.choiceSettingView];
                
                choiceSettingViewController.automaticallyAdjustsScrollViewInsets = NO;
                
                [weakSelf.navigationController pushViewController:choiceSettingViewController animated:YES];
                
                
            }
                
                break;
                
            case MyPageMenuAboutUs:
            {
                
                _aboutusView = [[BXJAboutusView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) withnav:self.navigationController];
                
                UIViewController *aboutusViewController = [[UIViewController alloc] init];
                [aboutusViewController.view addSubview:weakSelf.aboutusView];
                
                aboutusViewController.automaticallyAdjustsScrollViewInsets = NO;
                
                [weakSelf.navigationController pushViewController:aboutusViewController animated:YES];
                
                
            }
                
                break;
                
            case MyPageMenuFeedback:
            {
                
                _feedBackView = [[BXJFeedBackView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) withnav:self.navigationController];
                
                UIViewController *feedBackViewController = [[UIViewController alloc] init];
                [feedBackViewController.view addSubview:weakSelf.feedBackView];
                
                feedBackViewController.automaticallyAdjustsScrollViewInsets = NO;
                
                [weakSelf.navigationController pushViewController:feedBackViewController animated:YES];
                
                weakSelf.feedBackView.saveFeedbackAction = ^(NSString *signature, BOOL isJump){
                    
                    
                };
                
                
            }
                
                break;
                
            default:
                break;
        }
        
        
    };
    
    self.myPageView.SignInAction = ^(){
        
        [weakSelf.myPageView changeToMyPageSignIn];
        
    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

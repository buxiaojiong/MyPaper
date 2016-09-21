//
//  MyPageView.h
//  MyPaper
//
//  Created by sourcecode on 16/7/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, MyPageMenu) {
    MyPageMenuMyData,
    MyPageMenuMyCollection,
    MyPageMenuMyComment,
    MyPageMenuMyZanPost,
    MyPageMenuMyZanComment,
    MyPageMenuMyCai,
    MyPageMenuSetting,
    MyPageMenuMyChoice,
    MyPageMenuZanCount,
    MyPageMenuCaiCount,
    MyPageMenuFollowCount,
    MyPageMenuFanCount,
    MyPageMenuPostCount,
    MyPageMenuClearMemory,
    MyPageMenuFeedback,
    MyPageMenuAboutUs
};

typedef NS_ENUM(NSUInteger, MyPageSign) {
    MyPageSignIn,
    MyPageSignout
};

@interface BXJMyPageView : UIView

@property(nonatomic)void(^Action)(MyPageMenu mypageMenu, BOOL isJump);
@property(nonatomic)void(^SignInAction)();

- (instancetype)initWithFrame:(CGRect)frame withSign:(MyPageSign)myPageSign;

- (void)changeToMyPageSignIn;

@end

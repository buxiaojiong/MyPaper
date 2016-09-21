//
//  BXJSettingView.h
//  MyPaper
//
//  Created by sourcecode on 16/7/27.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MySettingMenu) {
    MySettingMenuAccountManager,
    MySettingMenuAccountBlackList,
    MySettingMenuAccountClearMemory,
    MySettingMenuAccountFeed,
    MySettingMenuAccountAboutUs
   
};

@interface BXJSettingView : UIView

@property(nonatomic)void(^SignOutAction)(BOOL success);

- (instancetype)initWithFrame:(CGRect)frame withnav:(UINavigationController *)nav;

@end

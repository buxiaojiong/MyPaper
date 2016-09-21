//
//  MyDataView.h
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MyDataMenu) {
    MyDataMenuHeadImage,
    MyDataMenuNickName,
    MyDataMenuSex,
    MyDataMenuBirthday,
    MyDataMenuArea,
    MyDataMenuAddress,
    MyDataMenuSignature
};

@interface BXJMyDataView : UIView

@property(nonatomic)void (^backAction)(BOOL isJump);

- (instancetype)initWithFrame:(CGRect)frame withnav:(UINavigationController *)nav;

@end

//
//  MyNickNameView.h
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BXJMyNickNameView : UIView

@property(nonatomic)void (^saveNickNameAction)(NSString *nickName ,BOOL isJump);

@end

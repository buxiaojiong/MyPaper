//
//  BXJFeedBackView.h
//  MyPaper
//
//  Created by sourcecode on 16/8/3.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BXJFeedBackView : UIView

@property(nonatomic)void (^saveFeedbackAction)(NSString *signature, BOOL isJump);

- (instancetype)initWithFrame:(CGRect)frame withnav:(UINavigationController *)nav;

@end

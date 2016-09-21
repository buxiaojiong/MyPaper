//
//  MySignatureView.h
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BXJMySignatureView : UIView

@property(nonatomic)void (^saveSignatureAction)(NSString *signature, BOOL isJump);

@end

//
//  MyAddressView.h
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BXJMyAddressView : UIView

@property(nonatomic)void (^saveAddressAction)(NSString *address,BOOL isJump);

@end

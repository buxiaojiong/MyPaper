//
//  MyFanStatus.h
//  MyPaper
//
//  Created by sourcecode on 16/7/25.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BXJMyFanStatus : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *lever;
@property (nonatomic, copy) NSString *leverName;
@property (nonatomic, copy) NSString *sign;
@property (nonatomic, assign) BOOL isFollowed;

@end

//
//  MyPageHeadView.h
//  MyPaper
//
//  Created by sourcecode on 16/7/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BXJProgressView.h"
#import "BXJMyPageView.h"

@class BXJMyStatus;
@class BXJMyPageView;


@interface BXJMyPageHeadView : UIView

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) BXJProgressView *progressView;

@property (nonatomic, strong) UILabel *levelLabel;

@property (nonatomic, strong) UILabel *levelName;

@property (nonatomic)void(^RetureMyaction)(MyPageMenu mypageMenu);

- (void)setMyData:(BXJMyStatus *)data;

@end

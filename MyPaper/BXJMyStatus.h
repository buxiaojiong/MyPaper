//
//  MyStatus.h
//  MyPaper
//
//  Created by sourcecode on 16/7/20.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, UGSex) {
    FeMale, //女
    Male, //男
    
};

@interface BXJMyStatus : NSObject

@property (nonatomic, copy) NSString *myName;

@property (nonatomic, assign) UGSex sex;

@property (nonatomic, assign) NSInteger nowLevel;

@property (nonatomic, assign) NSInteger maxLevel;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *levelName;

@property (nonatomic, assign) double zanCount;

@property (nonatomic, assign) double caiCount;

@property (nonatomic, assign) double followCount;

@property (nonatomic, assign) double fanCount;

@property (nonatomic, assign) double postCount;

@end

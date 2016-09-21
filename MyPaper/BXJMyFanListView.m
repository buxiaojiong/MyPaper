//
//  MyFanListView.m
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMyFanListView.h"
#import "TopWithBackbtnView.h"
#import "BXJMyFanStatus.h"
#import "BXJMyFanFollowListCell.h"

#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJMyFanListView ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation BXJMyFanListView

- (instancetype)initWithFrame:(CGRect)frame withnav:(UINavigationController *)nav
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
        
        TopWithBackbtnView *topBackBtnView = [[TopWithBackbtnView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
        [self addSubview:topBackBtnView];
        topBackBtnView.BackNacAction = ^(){
            
//            [UIView  animateWithDuration:0.3 animations:^{
//                
//                self.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
//                
//            } completion:^(BOOL finished) {
//                
//                if (_backAction) {
//                    _backAction(NO);
//                }
//                
//                [self removeFromSuperview];
//            }];
            
            [nav popViewControllerAnimated:YES];
            
        };
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 80, 44)];
        [topBackBtnView addSubview:titleLabel];
        
        CGPoint center = CGPointMake(WIDTH/2, topBackBtnView.center.y+10);
        titleLabel.center = center;
        titleLabel.font = [UIFont systemFontOfSize:17];
        titleLabel.textColor = UIColorFromRGB(0x2b2b2b);
        titleLabel.text = @"我的粉丝";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-74)];
        [self addSubview:self.tableView];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self insertSubview:self.tableView belowSubview:topBackBtnView];
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 10)];
        headView.backgroundColor = [UIColor clearColor];
        [self.tableView setTableHeaderView:headView];
        
        UIView *footerLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
        footerLine.backgroundColor = UIColorFromRGB(0xbdbdbd);
        footerLine.layer.shadowColor=[[UIColor blackColor] CGColor];
        footerLine.layer.shadowOffset=CGSizeMake(0, 1);
        footerLine.layer.shadowRadius=1;
        footerLine.layer.shadowOpacity=0.1;
        
        [self.tableView setTableFooterView:footerLine];
        
        
        self.dataArray = [NSMutableArray array];
        
        for (int i = 0; i < 14; i++) {
            
            BXJMyFanStatus *a1 = [[BXJMyFanStatus alloc] init];
            a1.name = @"Ruby幼熙";
            a1.lever = @"LV.100";
            a1.leverName = @"鸭蛋壳";
            a1.sign = @"我不管我就要吃旺旺碎冰冰";
            a1.isFollowed = NO;
            
            [self.dataArray addObject:a1];
        }
        
        
        
        
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 73;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BXJMyFanFollowListCell *cell = [BXJMyFanFollowListCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.myFanStatus = self.dataArray[indexPath.row];
    
    cell.followOrCancleAction = ^(UIButton *sender){
        
        sender.selected = !sender.selected;
        
        BXJMyFanStatus *a = self.dataArray[indexPath.row];
        a.isFollowed = sender.selected;
        
        [self.dataArray replaceObjectAtIndex:indexPath.row withObject:a];
        
  
        
    };
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end

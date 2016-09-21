//
//  BXJAccountManagerView.m
//  MyPaper
//
//  Created by sourcecode on 16/7/27.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJAccountManagerView.h"
#import "TopWithBackbtnView.h"

#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJAccountManagerView ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation BXJAccountManagerView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
        
        TopWithBackbtnView *topBackBtnView = [[TopWithBackbtnView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
        [self addSubview:topBackBtnView];
        topBackBtnView.BackNacAction = ^(){
            
            [UIView  animateWithDuration:0.3 animations:^{
                
                self.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
                
            } completion:^(BOOL finished) {
                
                [self removeFromSuperview];
            }];
            
        };
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 80, 44)];
        [topBackBtnView addSubview:titleLabel];
        
        CGPoint center = CGPointMake(WIDTH/2, topBackBtnView.center.y+10);
        titleLabel.center = center;
        titleLabel.font = [UIFont systemFontOfSize:17];
        titleLabel.textColor = UIColorFromRGB(0x2b2b2b);
        titleLabel.text = @"账号管理";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, WIDTH, HEIGHT)];
        [self addSubview:self.tableView];
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
      
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 10)];
        headView.backgroundColor = UIColorFromRGB(0xf2f2f2);
        [self.tableView setTableHeaderView:headView];
        
        UIView *footerLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
        footerLine.backgroundColor = UIColorFromRGB(0xbdbdbd);
        footerLine.layer.shadowColor=[[UIColor blackColor] CGColor];
        footerLine.layer.shadowOffset=CGSizeMake(0, 1);
        footerLine.layer.shadowRadius=1;
        footerLine.layer.shadowOpacity=0.1;
        
        [self.tableView setTableFooterView:footerLine];
        
        self.titleArray = @[@[@"手机号",@"修改密码"],@[@"新浪微博",@"微信",@"QQ"]];
        
    }
    return self;
}



- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
        titleView.backgroundColor = UIColorFromRGB(0xf2f2f2);
        UIView *footerLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
        footerLine.backgroundColor = UIColorFromRGB(0xbdbdbd);
        footerLine.layer.shadowColor=[[UIColor blackColor] CGColor];
        footerLine.layer.shadowOffset=CGSizeMake(0, 1);
        footerLine.layer.shadowRadius=1;
        footerLine.layer.shadowOpacity=0.1;
        [titleView addSubview:footerLine];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 1, 100, 30)];
        [titleView addSubview:titleLabel];
        titleLabel.text = @"账号绑定";
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = UIColorFromRGB(0x878787);
        
        return titleView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 30.f;
    }
    return 0.01f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rowsData = self.titleArray[section];
    return rowsData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 44, WIDTH, 1)];
        line.backgroundColor = UIColorFromRGB(0xededed);
        [cell.contentView addSubview:line];
        
        if (indexPath.section == 0) {
            UIImageView *accessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 14)];
            accessoryView.image = [UIImage imageNamed:@"accessoryView"];
            cell.accessoryView = accessoryView;
            
        }else{
            UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
            switchview.tag = indexPath.row;
            [switchview addTarget:self action:@selector(switchViewAction:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = switchview;
        }
    }
    cell.textLabel.text = self.titleArray[indexPath.section][indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.detailTextLabel.text = @"145******65";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)switchViewAction:(UISwitch *)sender
{
    
    NSLog(@"%ld",(long)sender.tag);
    
}

- (void)updateSwitchAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    UISwitch *switchView = (UISwitch *)cell.accessoryView;
    
    if ([switchView isOn]) {
        [switchView setOn:NO animated:YES];
    } else {
        [switchView setOn:YES animated:YES];
    }
    
}

@end

//
//  MyDataView.m
//  MyPaper
//
//  Created by sourcecode on 16/7/22.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJMyDataView.h"
#import "TopWithBackbtnView.h"
#import "BXJMyDataTableViewCell.h"
#import "BXJMyDataTableFirstCell.h"

#import "BXJMyNickNameView.h"
#import "BXJMySignatureView.h"
#import "BXJMyAddressView.h"

#import "STPickerArea.h"
#import "STPickerDate.h"
#import "STPickerSingle.h"

#import "UIImage+Circle.h"

#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJMyDataView ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) BXJMyNickNameView *myNickNameView;
@property (nonatomic, strong) BXJMySignatureView *mySignatureView;
@property (nonatomic, strong) BXJMyAddressView *myaddressView;
@property (nonatomic, assign) BOOL isJump;

@end

@implementation BXJMyDataView

- (instancetype)initWithFrame:(CGRect)frame withnav:(UINavigationController *)nav
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
        
        TopWithBackbtnView *topBackBtnView = [[TopWithBackbtnView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
        [self addSubview:topBackBtnView];
        topBackBtnView.BackNacAction = ^(){
//            
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
        titleLabel.text = @"我的资料";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT)];
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
        
        self.titleArray = @[@"头像",@"昵称",@"性别",@"出生年月",@"地区",@"详细地址",@"个性签名"];
        
        self.isJump = NO;
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger height;
    if (indexPath.row == 0) {
        height = 71;
    }else{
        height = 45;
    }
    
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        BXJMyDataTableFirstCell *cell = [BXJMyDataTableFirstCell cellWithTableView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.text = self.titleArray[indexPath.row];
        cell.userImageView.image = [[UIImage imageNamed:@"shit"] cutCircleImage];
        
        return cell;
    }else{
        BXJMyDataTableViewCell *cell = [BXJMyDataTableViewCell cellWithTableView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.text = self.titleArray[indexPath.row];
//        cell.detailLabel.text = @"事实上事实上事实上事实上事实上事实上事实上事实上";
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isJump) {
        return;
    }
    
    self.isJump = YES;
    
     __weak BXJMyDataView *weakSelf = self;
    
    if (indexPath.row == MyDataMenuNickName) {
        
        self.myNickNameView = [[BXJMyNickNameView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
        [self addSubview:self.myNickNameView];
        
        [UIView  animateWithDuration:0.3 animations:^{
            
            self.myNickNameView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
            
        } completion:^(BOOL finished) {
            
            self.myNickNameView.saveNickNameAction =^(NSString *nickName,BOOL isJump){
                
                _isJump = isJump;
                
                BXJMyDataTableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                cell.detailLabel.text = nickName;
                
            };
        }];
        
    }else if (indexPath.row == MyDataMenuSignature){
        
        self.mySignatureView = [[BXJMySignatureView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
        [self addSubview:self.mySignatureView];
        
        [UIView  animateWithDuration:0.3 animations:^{
            
            self.mySignatureView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
            
        } completion:^(BOOL finished) {
            
            self.mySignatureView.saveSignatureAction = ^(NSString *signature, BOOL isJump){
                
                _isJump = isJump;
                
                BXJMyDataTableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                cell.detailLabel.text = signature;
                
            };
            
        }];
    }else if (indexPath.row == MyDataMenuAddress){
        
        self.myaddressView = [[BXJMyAddressView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
        [self addSubview:self.myaddressView];
        
        [UIView  animateWithDuration:0.3 animations:^{
            
            self.myaddressView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
            
        } completion:^(BOOL finished) {
            
            self.myaddressView.saveAddressAction = ^(NSString *address,BOOL isJump){
                
                _isJump = isJump;
                
                BXJMyDataTableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                cell.detailLabel.text = address;
                
            };
            
        }];
    }else if (indexPath.row == MyDataMenuArea){
        
        STPickerArea *pickerArea = [[STPickerArea alloc]init];
//        [pickerArea setDelegate:self];
        [pickerArea setContentMode:STPickerContentModeBottom];
        [pickerArea show];
        
        pickerArea.STPickerAreaAction = ^(NSString *province,NSString *city,NSString *area){
          
            NSString *text = [NSString stringWithFormat:@"%@ %@ %@", province, city, area];
            BXJMyDataTableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
            cell.detailLabel.text = text;
            
            
        };
        
        _isJump = NO;
        
    }else if (indexPath.row == MyDataMenuBirthday){
        
        STPickerDate *pickerDate = [[STPickerDate alloc]init];
        pickerDate.STPickerDateAction = ^(NSInteger year,NSInteger month,NSInteger day){
            
            NSString *text = [NSString stringWithFormat:@"%ld-%ld-%ld", (long)year, (long)month, (long)day];
            BXJMyDataTableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
            cell.detailLabel.text = text;
        };
        [pickerDate show];
        
        _isJump = NO;
        
    }else if (indexPath.row == MyDataMenuSex){
        
        NSMutableArray *arrayData = [NSMutableArray array];
        [arrayData addObject:@"女"];
        [arrayData addObject:@"男"];
        [arrayData addObject:@"保密"];
        
        STPickerSingle *pickerSingle = [[STPickerSingle alloc]init];
        [pickerSingle setArrayData:arrayData];
        [pickerSingle setTitle:@"请选择性别"];
        pickerSingle.widthPickerComponent = WIDTH;
        [pickerSingle setContentMode:STPickerContentModeBottom];
        [pickerSingle show];
        
        pickerSingle.STPickerSingleAction = ^(NSString *selectedTitle){
            BXJMyDataTableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
            cell.detailLabel.text = selectedTitle;
        };
        
          _isJump = NO;
        
    }else{
        
#warning 头像
        
        
        _isJump = NO;
    }
}



@end

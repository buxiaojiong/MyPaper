//
//  BXJChoiceSettingView.m
//  MyPaper
//
//  Created by sourcecode on 16/7/28.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "BXJChoiceSettingView.h"
#import "TopWithBackbtnView.h"
#import <Masonry.h>
#import "BXJSaveButton.h"
#import "BXJChoiceSettingCell.h"
#import "BXJConstants.h"

#import "SelectSettingModel.h"

#define WIDTH [UIScreen mainScreen ].bounds.size.width
#define HEIGHT [UIScreen mainScreen ].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BXJChoiceSettingView ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *detailTitleArray;
@property (nonatomic, strong) NSArray *titleImageNameArray;

@property (nonatomic, strong) NSMutableArray *rangeArray;

@property (nonatomic, strong) NSMutableArray *sliderValueArray;

@end

@implementation BXJChoiceSettingView

- (instancetype)initWithFrame:(CGRect)frame withnav:(UINavigationController *)nav
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xf2f2f2);
        
        TopWithBackbtnView *topBackBtnView = [[TopWithBackbtnView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
        [self addSubview:topBackBtnView];
        topBackBtnView.BackNacAction = ^(){
            
            [nav popViewControllerAnimated:YES];
            
        };
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 80, 44)];
        [topBackBtnView addSubview:titleLabel];
        
        CGPoint center = CGPointMake(WIDTH/2, topBackBtnView.center.y+10);
        titleLabel.center = center;
        titleLabel.font = [UIFont systemFontOfSize:17];
        titleLabel.textColor = UIColorFromRGB(0x2b2b2b);
        titleLabel.text = @"精选设置";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        BXJSaveButton *saveBtn = [[BXJSaveButton alloc] initWithFrame:CGRectMake( WIDTH - 60 - 10,20, 60, 64)];
        [topBackBtnView addSubview:saveBtn];
        [saveBtn addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, WIDTH, HEIGHT - 65) style:UITableViewStyleGrouped];
        [self addSubview:self.tableView];
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 69)];
        footerView.backgroundColor = UIColorFromRGB(0xf2f2f2);
        
        UIView *footerLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
        [footerView addSubview:footerLine];
        footerLine.backgroundColor = UIColorFromRGB(0xbdbdbd);
        footerLine.layer.shadowColor=[[UIColor blackColor] CGColor];
        footerLine.layer.shadowOffset=CGSizeMake(0, 1);
        footerLine.layer.shadowRadius=1;
        footerLine.layer.shadowOpacity=0.1;
        
        [self.tableView setTableFooterView:footerView];
        
        self.titleArray = @[@"基本信息",@"详细信息",@"其他信息"];
        self.detailTitleArray = @[@[@[@"身高(cm)",@"身高范围"],@[@"体重(kg)",@"体重范围"]],
                                  @[@[@"胸围(cm)",@"胸围范围"],@[@"腰围(cm)",@"腰围范围"],@[@"臀围(cm)",@"臀围范围"]],
                                  @[@[@"年龄(岁)",@"年龄范围"]]];
        self.titleImageNameArray = @[@"baseInfomation",@"detailInfomation",@"otherInfomation"];
        
        SelectSettingModel *selectSettingModle = [[SelectSettingModel alloc] init];
        
        selectSettingModle.height = @50;
        selectSettingModle.heightrange = @10;
        
        selectSettingModle.weight = @9;
        selectSettingModle.weightrange = @9;
        
        selectSettingModle.bust = @100;
        selectSettingModle.bustrange = @100;
        
        selectSettingModle.waist = @27;
        selectSettingModle.waistrange = @10;
        
        selectSettingModle.hip = @33;
        selectSettingModle.hiprange = @10;
        
        selectSettingModle.age = @23;
        selectSettingModle.agerange = @9;
        
      
        
        self.rangeArray = [NSMutableArray arrayWithObjects:@[selectSettingModle.heightrange,selectSettingModle.weightrange],@[selectSettingModle.bustrange,selectSettingModle.waistrange,selectSettingModle.hiprange],@[selectSettingModle.agerange], nil];

        self.sliderValueArray = [NSMutableArray arrayWithObjects:@[selectSettingModle.height,selectSettingModle.weight],@[selectSettingModle.bust,selectSettingModle.waist,selectSettingModle.hip],@[selectSettingModle.age], nil];
        
    }
    return self;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 65)];
    headView.backgroundColor = UIColorFromRGB(0xf2f2f2);
    
    if (section != 0) {
        UIView *footerLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
        [headView addSubview:footerLine];
        footerLine.backgroundColor = UIColorFromRGB(0xbdbdbd);
        footerLine.layer.shadowColor=[[UIColor blackColor] CGColor];
        footerLine.layer.shadowOffset=CGSizeMake(0, 1);
        footerLine.layer.shadowRadius=1;
        footerLine.layer.shadowOpacity=0.1;
    }
 
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, WIDTH, 55)];
    contentView.backgroundColor = [UIColor whiteColor];
    [headView addSubview:contentView];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectZero];
    titleView.center =  CGPointMake(contentView.center.x, contentView.center.y-10);
    titleView.bounds = CGRectMake(0, 0, 68 + 15, 16);
//    titleView.backgroundColor = [UIColor redColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 16)];
    [titleView addSubview:titleLabel];
    titleLabel.text = self.titleArray[section];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = UIColorFromRGB(0x878787);
//    titleLabel.backgroundColor = [UIColor greenColor];
    
    UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(68, 0.5, 15, 15)];
    [titleView addSubview:titleImageView];
    titleImageView.image = [UIImage imageNamed:self.titleImageNameArray[section]];
//    titleImageView.backgroundColor = [UIColor yellowColor];
    
    UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(30, titleView.center.y, (WIDTH - 68-15 - 60 - 14)/2, 1)];
    [contentView addSubview:leftLine];
    leftLine.backgroundColor = UIColorFromRGB(0xededed);
    
    UIView *rightLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleView.frame) + 7, titleView.center.y, (WIDTH - 68-15 - 60 - 14)/2, 1)];
    [contentView addSubview:rightLine];
    rightLine.backgroundColor = UIColorFromRGB(0xededed);
    
    [contentView addSubview:titleView];
    
    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 65.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *rowsData = self.detailTitleArray[section];

    return rowsData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 103.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BXJChoiceSettingCell *cell = [BXJChoiceSettingCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *rowsData = self.detailTitleArray[indexPath.section][indexPath.row];
    
    cell.firstLabel.text = rowsData[0];
    cell.secondLabel.text = rowsData[1];
    
    
   __weak BXJChoiceSettingCell *weakCell = cell;
    
    cell.sliderChangeAction = ^(float value){
        
        weakCell.slider.value = value;
        
        [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
        
    };
    
    if (indexPath.section == 0 && indexPath.row ==0) {
        
        cell.slider.maximumValue = ChoiceSettingHeightMaximumValue;
        cell.slider.minimumValue = ChoiceSettingHeightMinimumValue;

        float value = [self.sliderValueArray[indexPath.section][indexPath.row] floatValue];
        [cell.slider setValue:value animated:NO];
        
        NSString *rangeText = [NSString stringWithFormat:@"%@cm",self.rangeArray[indexPath.section][indexPath.row]];
        cell.rangeText = rangeText;
        
        
        cell.reduceSliderValueAction = ^(){
            
            float value = weakCell.slider.value - 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
            
        };
        
        cell.addSliderValueAction = ^(){
            
            float value = weakCell.slider.value + 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
        };
        
        cell.reduceRangeAction = ^(){

            weakCell.rangeText =  [self reduceRangeTextAtIndexPath:indexPath withUnit:@"cm"];
        };
        
        cell.addRangeAction = ^(){

            weakCell.rangeText = [self addRangeTextAtIndexPath:indexPath withUnit:@"cm"];
        };
        
    }else if (indexPath.section == 0 && indexPath.row ==1){
        cell.slider.maximumValue = ChoiceSettingWeightMaximumValue;
        cell.slider.minimumValue = ChoiceSettingWeightMinimumValue;
        
        float value = [self.sliderValueArray[indexPath.section][indexPath.row] floatValue];
        [cell.slider setValue:value animated:NO];
        
        NSString *rangeText = [NSString stringWithFormat:@"%@kg",self.rangeArray[indexPath.section][indexPath.row]];
        cell.rangeText = rangeText;
        
        cell.reduceSliderValueAction = ^(){
            
            float value = weakCell.slider.value - 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
            
        };
        
        cell.addSliderValueAction = ^(){
            
            float value = weakCell.slider.value + 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
        };
        
        cell.reduceRangeAction = ^(){
            
            weakCell.rangeText =  [self reduceRangeTextAtIndexPath:indexPath withUnit:@"kg"];
        };
        
        cell.addRangeAction = ^(){
            
            weakCell.rangeText = [self addRangeTextAtIndexPath:indexPath withUnit:@"kg"];
        };
        
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
        cell.slider.maximumValue = ChoiceSettingBustMaximumValue;
        cell.slider.minimumValue = ChoiceSettingBustMinimumValue;
        
        float value = [self.sliderValueArray[indexPath.section][indexPath.row] floatValue];
        [cell.slider setValue:value animated:NO];
        
        NSString *rangeText = [NSString stringWithFormat:@"%@cm",self.rangeArray[indexPath.section][indexPath.row]];
        cell.rangeText = rangeText;
        
        cell.reduceSliderValueAction = ^(){
            
            float value = weakCell.slider.value - 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
            
        };
        
        cell.addSliderValueAction = ^(){
            
            float value = weakCell.slider.value + 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
        };
        
        cell.reduceRangeAction = ^(){
            
            weakCell.rangeText =  [self reduceRangeTextAtIndexPath:indexPath withUnit:@"cm"];
        };
        
        cell.addRangeAction = ^(){
            
            weakCell.rangeText = [self addRangeTextAtIndexPath:indexPath withUnit:@"cm"];
        };
        
    }else if (indexPath.section == 1 && indexPath.row == 1){
        cell.slider.maximumValue = ChoiceSettingWaistMaximumValue;
        cell.slider.minimumValue = ChoiceSettingWaistMinimumValue;
        
        float value = [self.sliderValueArray[indexPath.section][indexPath.row] floatValue];
        [cell.slider setValue:value animated:NO];
        
        NSString *rangeText = [NSString stringWithFormat:@"%@cm",self.rangeArray[indexPath.section][indexPath.row]];
        cell.rangeText = rangeText;
        
        cell.reduceSliderValueAction = ^(){
            
            float value = weakCell.slider.value - 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
            
        };
        
        cell.addSliderValueAction = ^(){
            
            float value = weakCell.slider.value + 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
        };
        
        cell.reduceRangeAction = ^(){
            
            weakCell.rangeText =  [self reduceRangeTextAtIndexPath:indexPath withUnit:@"cm"];
        };
        
        cell.addRangeAction = ^(){
            
            weakCell.rangeText = [self addRangeTextAtIndexPath:indexPath withUnit:@"cm"];
        };
        
    }else if (indexPath.section == 1 && indexPath.row == 2){
        cell.slider.maximumValue = ChoiceSettingHiplineMaximumValue;
        cell.slider.minimumValue = ChoiceSettingHiplineMinimumValue;
        
        float value = [self.sliderValueArray[indexPath.section][indexPath.row] floatValue];
        [cell.slider setValue:value animated:NO];
        
        NSString *rangeText = [NSString stringWithFormat:@"%@cm",self.rangeArray[indexPath.section][indexPath.row]];
        cell.rangeText = rangeText;
        
        cell.reduceSliderValueAction = ^(){
            
            float value = weakCell.slider.value - 1.f;
            
            weakCell.slider.value = value;
            
            NSLog(@"%f",value);
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
            
        };
        
        cell.addSliderValueAction = ^(){
            
            float value = weakCell.slider.value + 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
        };
        
        cell.reduceRangeAction = ^(){
            
            weakCell.rangeText =  [self reduceRangeTextAtIndexPath:indexPath withUnit:@"cm"];
        };
        
        cell.addRangeAction = ^(){
            
            weakCell.rangeText = [self addRangeTextAtIndexPath:indexPath withUnit:@"cm"];
        };
        
    }else{
        cell.slider.maximumValue = ChoiceSettingAgeMaximumValue;
        cell.slider.minimumValue = ChoiceSettingAgeMinimumValue;
        
        float value = [self.sliderValueArray[indexPath.section][indexPath.row] floatValue];
        [cell.slider setValue:value animated:NO];
        
        NSString *rangeText = [NSString stringWithFormat:@"%@岁",self.rangeArray[indexPath.section][indexPath.row]];
        cell.rangeText = rangeText;
        
        cell.reduceSliderValueAction = ^(){
            
            float value = weakCell.slider.value - 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
            
        };
        
        cell.addSliderValueAction = ^(){
            
            float value = weakCell.slider.value + 1.f;
            
            weakCell.slider.value = value;
            
            [self changeSliderValueArrayAtIndexPath:indexPath withNumber:value];
        };
        
        cell.reduceRangeAction = ^(){
            
            weakCell.rangeText =  [self reduceRangeTextAtIndexPath:indexPath withUnit:@"岁"];
        };
        
        cell.addRangeAction = ^(){
            
            weakCell.rangeText = [self addRangeTextAtIndexPath:indexPath withUnit:@"岁"];
        };
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)saveAction:(id)sender
{
    
    SelectSettingModel *selectSettingModle = [[SelectSettingModel alloc] init];
    
    selectSettingModle.height = self.sliderValueArray[0][0];
    selectSettingModle.heightrange = self.rangeArray[0][0];
    
    selectSettingModle.weight = self.sliderValueArray[0][1];
    selectSettingModle.weightrange = self.rangeArray[0][1];
    
    selectSettingModle.bust = self.sliderValueArray[1][0];
    selectSettingModle.bustrange = self.rangeArray[1][0];
    
    selectSettingModle.waist = self.sliderValueArray[1][1];
    selectSettingModle.waistrange = self.rangeArray[1][1];
    
    selectSettingModle.hip = self.sliderValueArray[1][2];
    selectSettingModle.hiprange = self.rangeArray[1][2];
    
    selectSettingModle.age = self.sliderValueArray[2][0];
    selectSettingModle.agerange = self.rangeArray[2][0];
    
    NSLog(@"%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@",selectSettingModle.height,selectSettingModle.heightrange,selectSettingModle.weight,selectSettingModle.weightrange,selectSettingModle.bust,selectSettingModle.bustrange,selectSettingModle.waist,selectSettingModle.waistrange,selectSettingModle.hip,selectSettingModle.hiprange,selectSettingModle.age,selectSettingModle.agerange);
    
}

- (NSString *)reduceRangeTextAtIndexPath:(NSIndexPath *)indexPath withUnit:(NSString *)unit
{
    int a = [self.rangeArray[indexPath.section][indexPath.row] intValue];
    
    if (a > 0) {
        a = a - 1;
    }else{
        a = 0;
    }
    
    [self changeRangeArrayAtIndexPath:indexPath withNumber:a];
    
    NSString *rangeText = [NSString stringWithFormat:@"%d%@",a,unit];
    
    return rangeText;
}

- (NSString *)addRangeTextAtIndexPath:(NSIndexPath *)indexPath withUnit:(NSString *)unit
{
    int a = [self.rangeArray[indexPath.section][indexPath.row] intValue];
    
    a = a + 1;
    
    [self changeRangeArrayAtIndexPath:indexPath withNumber:a];
    
    NSString *rangeText = [NSString stringWithFormat:@"%d%@",a,unit];
    
    return rangeText;
}

- (void)changeRangeArrayAtIndexPath:(NSIndexPath *)indexPath withNumber:(int)number
{
    NSNumber *range = [NSNumber numberWithInt:number];
    
    NSMutableArray *firstArray = [NSMutableArray arrayWithArray:self.rangeArray[indexPath.section]];

    firstArray[indexPath.row] = range;
    
    self.rangeArray[indexPath.section] = firstArray;
}

- (void)changeSliderValueArrayAtIndexPath:(NSIndexPath *)indexPath withNumber:(float)number
{
    NSNumber *range = [NSNumber numberWithFloat:number];
    
    NSMutableArray *firstArray = [NSMutableArray arrayWithArray:self.sliderValueArray[indexPath.section]];
    
    firstArray[indexPath.row] = range;
    
    self.sliderValueArray[indexPath.section] = firstArray;
}


@end

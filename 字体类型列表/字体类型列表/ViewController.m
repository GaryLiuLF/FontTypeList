//
//  ViewController.m
//  字体类型列表
//
//  Created by gary.liu on 17/4/20.
//  Copyright © 2017年 刘林飞. All rights reserved.
//

#import "ViewController.h"
#import "FontFamilyModel.h"

#define kNormalString @"刘林飞-Garyliu@123.com"
@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *stytles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"字体样式";
    
    [self setupUI];
}

- (void)setupUI {
    
    [self getFontStytles];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:246 / 255.0 blue:246 / 255.0 alpha:1.0];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (void)getFontStytles {

    self.stytles = [NSMutableArray array];
    
    for (NSString *fontFamilyName in [UIFont familyNames]) {
        NSMutableArray *fontNames = [NSMutableArray array];
        for (NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName]) {
            [fontNames addObject:fontName];
        }
        FontFamilyModel *model = [[FontFamilyModel alloc]init];
        model.familyName = fontFamilyName;
        model.fontNames = fontNames;
        [self.stytles addObject:model];
        
        
//        NSLog(@"\nfamily = %@,  font = %@ \n\n\n\n",fontFamilyName, fontNames);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.stytles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FontFamilyModel *model = self.stytles[section];
    return model.fontNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    }
    FontFamilyModel *model = self.stytles[indexPath.section];
    cell.textLabel.text = kNormalString;
    cell.textLabel.font = [UIFont fontWithName:model.fontNames[indexPath.row] size:20];
    cell.detailTextLabel.text = model.fontNames[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 10, 40)];
    lab.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:246 / 255.0 blue:246 / 255.0 alpha:0.8];
    lab.textColor = [UIColor lightGrayColor];
    lab.font = [UIFont systemFontOfSize:15];
    
    FontFamilyModel *model = self.stytles[section];
    lab.text = model.familyName;
    
    return lab;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.5;
}




@end

//
//  ViewController.m
//  KWheelDemo
//
//  Created by K on 17/1/23.
//  Copyright © 2017年 KHGG. All rights reserved.
//

#import "ViewController.h"
#import "WheelView.h"

static NSString * cellIdentifier = @"cellIdentifier";

@interface ViewController ()<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, copy  ) NSArray * dataSource;

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _dataSource = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _dataSource[indexPath.row]];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

#pragma mark - Getter
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[WheelView alloc] initWithFrame:CGRectMake(100, 200, 150, 100) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.pagingEnabled = YES;
        _tableView.rowHeight = 100;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

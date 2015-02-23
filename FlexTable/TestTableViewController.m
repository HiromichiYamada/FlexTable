//
//  TestTableViewController.m
//  FlexTable
//
//  Created by 山田宏道 on 2015/02/21.
//  Copyright (c) 2015年 Torques Inc. All rights reserved.
//

#import "TestTableViewController.h"
#import "FlexCell.h"

@interface TestTableViewController ()
<UITableViewDataSource, UITableViewDelegate>

@end

@implementation TestTableViewController
{
	__weak IBOutlet UITableView *tableList;
	
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	tableList.delegate	= self;
	tableList.dataSource	= self;
	[tableList layoutIfNeeded];	// セルのサイズを決めるために必要.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

- (void)viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	FlexCell*	cell = [tableView dequeueReusableCellWithIdentifier:@"FlexCell"];
	
	[cell setupContentsForIndexPath:indexPath];
	
	return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [FlexCell heightForTable:tableView forIndexPath:indexPath];
}

// 高さ計算の最適化.
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewAutomaticDimension;
}

@end

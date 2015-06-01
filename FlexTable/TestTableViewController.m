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
	
	[self setupUIForNavigationController];
	
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

#pragma mark - methods for actions

- (void) setupUIForNavigationController
{
	if( self.navigationController != nil ){
		UIBarButtonItem*	buttonBottom	= [[UIBarButtonItem alloc] initWithTitle:@"Bottom" style:UIBarButtonItemStylePlain target:self action:@selector(buttonBottomPressed:)];
		self.navigationItem.rightBarButtonItem	= buttonBottom;
	}
}

- (void) buttonBottomPressed:(id)sender
{
	[self showBottom];
}

#pragma mark - methods.

- (void) showBottom
{
	int bottomSection	= [tableList numberOfSections] - 1;
	int	bottomRow			= [tableList numberOfRowsInSection:bottomSection] - 1;
	NSIndexPath	*indexPath	= [NSIndexPath indexPathForRow:bottomRow inSection:bottomSection];
	
	NSLog(@"show bottom [%d:%d]", bottomSection, bottomRow);
	[tableList scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
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

/*
// 高さ計算の最適化. .. これを有効にすると、Bottom Buttonの計算がきちんと行われない.
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewAutomaticDimension;
}
*/

@end

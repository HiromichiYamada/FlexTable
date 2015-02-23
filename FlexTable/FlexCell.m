//
//  FlexCell.m
//  FlexTable
//
//  Created by 山田宏道 on 2015/02/21.
//  Copyright (c) 2015年 Torques Inc. All rights reserved.
//

#import "FlexCell.h"

@implementation FlexCell

- (void)awakeFromNib {
	// Initialization code
	
//	self.autoresizingMask	= UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	self.bodyLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.bodyLabel.bounds);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

- (void) setupContentsForIndexPath:(NSIndexPath*)indexPath
{
	NSMutableString*	bodyText	= [NSMutableString string];
	int row = (int)indexPath.row;
	for( int i=0; i<=row; i++ ){
		[bodyText appendString:@"テスト文字列！"];
	}
	
	self.bodyLabel.text	= bodyText;
}

static FlexCell*	sizingCell	= nil;

+ (CGFloat) heightForTable:(UITableView*)tableView forIndexPath:(NSIndexPath*)indexPath
{
	if( sizingCell == nil ){
		sizingCell	=
		(FlexCell*)[tableView dequeueReusableCellWithIdentifier:@"FlexCell"];
	}
	
//	CGRect	cellFrame = sizingCell.frame;
//	cellFrame.size.width	= CGRectGetWidth(tableView.bounds);
//	sizingCell.frame	= cellFrame;
	
	[sizingCell setupContentsForIndexPath:indexPath];
	
	CGSize	retSize	= [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
	NSLog(@"cell (%d:%d) %@", (int)indexPath.section, (int)indexPath.row, NSStringFromCGSize(retSize));
	return retSize.height;
}

@end

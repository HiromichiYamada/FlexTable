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


@end

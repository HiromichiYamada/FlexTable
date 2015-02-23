//
//  FlexCell.h
//  FlexTable
//
//  Created by 山田宏道 on 2015/02/21.
//  Copyright (c) 2015年 Torques Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlexCell : UITableViewCell

- (void) setupContentsForIndexPath:(NSIndexPath*)indexPath;

@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@end



//
//  PopoerTable.h
//  test
//
//  Created by libo on 11/26/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CellSelect)(NSInteger index);

@interface PopoverTable : UITableViewController

@property (nonatomic, copy) CellSelect cellSelect;

@property (nonatomic, strong) NSArray *dataArray;

@end

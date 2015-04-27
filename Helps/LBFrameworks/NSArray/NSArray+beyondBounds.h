//
//  NSArray+beyondBounds.h
//  ShaoNianPai
//
//  Created by libo on 12/1/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (beyondBounds)

/*
 * 会覆盖NSMutableArray NSMutableArray里设置不管用
 */
- (id)objectAt:(NSUInteger)index;
//- (id)objectAtIndex:(NSUInteger)index

@end

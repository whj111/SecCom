//
//  NSArray+beyondBounds.m
//  ShaoNianPai
//
//  Created by libo on 12/1/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "NSArray+beyondBounds.h"

@implementation NSArray (beyondBounds)


- (id)objectAt:(NSUInteger)index
{
    if (index < self.count) {
        return self[index];
    }else{
        NSLog(@"越界");
        return nil;
    }
}

@end

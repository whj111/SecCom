//
//  LBRandom.m
//  NQYoungCloud
//
//  Created by libo on 14-9-26.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import "LBRandom.h"

@implementation LBRandom

+ (NSString *)randomString{
    int NUMBER_OF_CHARS = 10;
    char data[NUMBER_OF_CHARS];
    for (int x=0;x<NUMBER_OF_CHARS;data[x++] = (char)('A' + (arc4random_uniform(26))));
    NSString *str = [[NSString alloc] initWithBytes:data length:NUMBER_OF_CHARS encoding:NSUTF8StringEncoding];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    formater.timeZone = [NSTimeZone systemTimeZone];
    [formater setDateFormat:@"hh:mm:ss"];
    NSString *timestr = [formater stringFromDate: date];
    
    return [timestr stringByAppendingString:str];
}

- (NSString *)timeNow{
    NSDate *date = [NSDate date];
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    formater.timeZone = [NSTimeZone systemTimeZone];
    [formater setDateFormat:@"hh:mm:ss"];
    NSString *timestr = [formater stringFromDate: date];
    return timestr;
}

+ (NSInteger)randomInt{
    int y = (arc4random() % 5001) + 5000;
    return y;
}

@end

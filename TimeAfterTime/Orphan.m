//
//  Orphan.m
//  TimeAfterTime
//
//  Created by Jack Danger on 12/4/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import "Orphan.h"

@implementation Orphan

- (NSString *)description
{
    return [NSString stringWithFormat:@"%p", self];
}
- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}
@end

//
//  BNRLogger.h
//  TimeAfterTime
//
//  Created by Jack Danger on 12/4/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRUrlGetterLogger.h"
#define GUTENBERG_URI @"http://www.gutenberg.org/cache/epub/205/pg205.txt"

@interface Repeater : NSObject

@property (nonatomic) NSDate *date;
@property (nonatomic) BNRUrlGetterLogger *logger;

-(void)tick:(NSTimer *)t;

@end

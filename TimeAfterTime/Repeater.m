//
//  BNRLogger.m
//  TimeAfterTime
//
//  Created by Jack Danger on 12/4/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import "Repeater.h"

@implementation Repeater

-(Repeater *)init {
    if (!self.logger) {
        self.logger = [[BNRUrlGetterLogger alloc] init];
    }
    return self;
}

-(NSArray *)strings {
    return @[@"Fido", @"Lady Lydia", @"Boscoe", @"Lisa", @"Biff McGunn"];
}

-(void)tick:(NSTimer *)t {
    
    NSMutableArray *stringsWithNoVowels = [NSMutableArray array];
    
    NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];

    [self.strings enumerateObjectsUsingBlock: ^(id string, NSUInteger i, BOOL *stop) {
        NSRange yRange = [string rangeOfString:@"y" options:NSCaseInsensitiveSearch];
        
        if (yRange.location != NSNotFound) {
            *stop = YES;
            return;
        }
        
        NSMutableString *mutableString = [NSMutableString stringWithString:string];
        for (NSString *s in vowels) {
            NSRange fullRange = NSMakeRange(0, [mutableString length]);
            [mutableString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
        }
        [stringsWithNoVowels addObject:mutableString];
    }];
    NSLog(@"devowelized strings: %@", stringsWithNoVowels);
}



@end

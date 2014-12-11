//
//  main.m
//  TimeAfterTime
//
//  Created by Jack Danger on 12/4/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <readline/readline.h>
#import <stdio.h>
#import "Repeater.h"
void findPeople(const char *arg);
typedef void(^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);


int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        //Repeater *downloader = [[Repeater alloc] init];
        //[NSTimer scheduledTimerWithTimeInterval:2.0 target:downloader selector:@selector(tick:) userInfo:nil repeats:YES];
        //[[NSRunLoop currentRunLoop] run];
        
        
    }
    
    if (argv[1]) {
        findPeople(argv[1]);
    }
    
    return 0;
}

void findPeople(const char * arg) {
    NSData *peopleData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://people.squareup.com/people.json"]];
    NSArray *people = [NSJSONSerialization JSONObjectWithData:peopleData
                                                      options:0
                                                        error:nil];
    NSString *name = [NSString stringWithUTF8String:arg];
    NSString *namePattern = [NSString stringWithFormat:@"^%@$", name];
    NSRegularExpression *nameRegex = [NSRegularExpression regularExpressionWithPattern:namePattern options:0 error:nil];
    
    printf("Searching for people matching: %s\n", [namePattern UTF8String]);
    
    for (NSDictionary *person in people) {
        NSString *firstName = person[@"First"];
        if ([nameRegex numberOfMatchesInString:firstName options:0 range:NSMakeRange(0, firstName.length)] > 0) {
            NSString *first = person[@"First"];
            NSString *last = person[@"Last"];
            printf("%s %s\n", [first UTF8String], [last UTF8String]);
        }
    }
}

//
//  BNRLogger.m
//  TimeAfterTime
//
//  Created by Jack Danger on 12/5/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import "BNRUrlGetterLogger.h"

@implementation BNRUrlGetterLogger

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"Received %d bytes of data", (unsigned int)[data length]);
    if (!_incomingData) {
        _incomingData = [[NSMutableData alloc] init];
    }
    [_incomingData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Finished loading! Total bytes: %d", (unsigned int)_incomingData.length);
    
    NSString *all = [[NSString alloc] initWithData:_incomingData encoding:NSUTF8StringEncoding];
    NSLog(@"String has %lu characters", all.length);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Whoops!: %@", error);
}
@end

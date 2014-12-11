//
//  BNRLogger.h
//  TimeAfterTime
//
//  Created by Jack Danger on 12/5/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRUrlGetterLogger : NSObject <NSURLConnectionDataDelegate, NSURLConnectionDataDelegate>

{
    NSMutableData *_incomingData;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

@end

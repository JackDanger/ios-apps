//
//  BNRStockHolding.h
//  TimeAfterTime
//
//  Created by Jack Danger on 12/4/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject

@property (nonatomic) int numberOfShares;
@property (nonatomic) double purchaseSharePrice;
@property (nonatomic) double currentSharePrice;

+(BNRStockHolding *)initWithShares:(int)num withPurchasePrice:(double)cost andCurrentPrice:(double)value;
-(double)profit;
-(double)costInDollars;
-(double)valueInDollars;
@end

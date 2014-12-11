//
//  BNRStockHolding.m
//  TimeAfterTime
//
//  Created by Jack Danger on 12/4/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

+(BNRStockHolding *)initWithShares:(int)num withPurchasePrice:(double)cost andCurrentPrice:(double)value {
    BNRStockHolding *instance = [[BNRStockHolding alloc] init];
    instance.purchaseSharePrice = cost;
    instance.currentSharePrice = value;
    instance.numberOfShares = num;
    return instance;
}

-(double)profit {
    return self.valueInDollars - self.costInDollars;
}

-(double)costInDollars {
    return self.purchaseSharePrice * self.numberOfShares;
}
-(double)valueInDollars {
    return self.currentSharePrice * self.numberOfShares;
}

@end

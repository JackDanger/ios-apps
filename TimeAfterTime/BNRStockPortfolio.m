//
//  BNRStockPortfolio.m
//  TimeAfterTime
//
//  Created by Jack Danger on 12/4/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import "BNRStockPortfolio.h"

@implementation BNRStockPortfolio

-(BNRStockPortfolio *)init {
    BNRStockPortfolio *instance = [super init];
    if (!instance.stocks) {
        instance.stocks = [NSMutableArray array];
    }
    return instance;
}

-(void)addStock:(BNRStockHolding *)stock {
    [[self stocks] addObject:stock];
}
-(double)currentValue {
    double total = 0.0;
    for (BNRStockHolding *stock in self.stocks) {
        total += stock.profit;
    }
    return total;
}
@end

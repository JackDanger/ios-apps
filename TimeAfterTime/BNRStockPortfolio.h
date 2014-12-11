//
//  BNRStockPortfolio.h
//  TimeAfterTime
//
//  Created by Jack Danger on 12/4/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"

@interface BNRStockPortfolio : NSObject

@property (nonatomic) NSMutableArray *stocks;

-(void)addStock:(BNRStockHolding *)stock;
-(double)currentValue;

@end

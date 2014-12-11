//
//  BNRPerson.m
//  TimeAfterTime
//
//  Created by Jack Danger on 12/4/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson

-(float)heightInMeters {
    return _heightInMeters;
}
-(int)weightInKilos {
    return _weightInKilos;
}
-(void)setHeightInMeters:(float)h {
    _heightInMeters = h;
}
-(void)setWeightInKilos:(int)w {
    _weightInKilos = w;
}

-(float)bodyMassIndex {
    return self.weightInKilos / (self.heightInMeters * self.heightInMeters);
}

@end

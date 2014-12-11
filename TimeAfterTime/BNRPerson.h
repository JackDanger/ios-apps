//
//  BNRPerson.h
//  TimeAfterTime
//
//  Created by Jack Danger on 12/4/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject

{
    float _heightInMeters;
    int _weightInKilos;
}

- (float)heightInMeters;
- (void)setHeightInMeters:(float)h;
- (int)weightInKilos;
- (void)setWeightInKilos:(int)w;

- (float)bodyMassIndex;

@end

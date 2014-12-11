//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Jack Danger on 12/8/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

//-(instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    
//    if (self) {
//        self.backgroundColor = [UIColor clearColor];
//        self.arcColor = [UIColor orangeColor];
//    }
//    return self;
//}

-(void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + (bounds.size.width / 2.0);
    center.y = bounds.origin.y + (bounds.size.height / 2.0);
    self.center = center;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= GAP) {
        [path moveToPoint:CGPointMake(self.center.x + currentRadius, self.center.y)];
        
        [path addArcWithCenter:self.center radius:currentRadius startAngle:0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    path.lineWidth = GAP / 2.0;
    
    [self.arcColor setStroke];
    
    [path stroke];
}
@end



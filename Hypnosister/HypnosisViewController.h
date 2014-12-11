//
//  HypnosisViewController.h
//  Hypnosister
//
//  Created by Jack Danger on 12/8/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisViewController : UIViewController

@property (nonatomic, strong) UIScrollView *view;
@property (nonatomic, weak) UITextField *textField;
@property (nonatomic, weak) UILabel *label;

-(void)tick;

@end

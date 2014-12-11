//
//  RootViewController.h
//  ExamplePageObjC
//
//  Created by Jack Danger on 12/3/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end


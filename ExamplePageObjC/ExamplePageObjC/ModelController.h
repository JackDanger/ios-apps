//
//  ModelController.h
//  ExamplePageObjC
//
//  Created by Jack Danger on 12/3/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end


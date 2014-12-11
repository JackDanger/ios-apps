//
//  HypnosisViewController.m
//  Hypnosister
//
//  Created by Jack Danger on 12/8/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

#import "HypnosisViewController.h"

@interface HypnosisViewController () <UITextFieldDelegate>
@end

@implementation HypnosisViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hyp-motize";
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self tick];
}

-(void)tick {
    float r = (arc4random() % 100) / 100.0;
    float g = (arc4random() % 100) / 100.0;
    float b = (arc4random() % 100) / 100.0;
    
    ((HypnosisView *)self.view.subviews[0]).arcColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
    r = (arc4random() % 50) / 100.0 + 0.5;
    g = (arc4random() % 50) / 100.0 + 0.5;
    b = (arc4random() % 50) / 100.0 + 0.5;
    self.label.textColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
    CGRect labelFrame = CGRectMake(
               arc4random() % ((int)self.view.bounds.size.width - 200),
               arc4random() % ((int)self.view.bounds.size.height - 220),
               400,
               300
            );
    
    self.label.font = [UIFont systemFontOfSize:(rand() % 40 + 80)];
    [self.label sizeToFit];
    self.label.frame = labelFrame;
    
    [self.view setNeedsDisplay];
}

-(void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    HypnosisView *hypnosisView = [[HypnosisView alloc] initWithFrame:frame];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    
    [scrollView addSubview:hypnosisView];
    self.view = scrollView;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 800, 100)];
    self.label = label;
    self.label.font = [UIFont systemFontOfSize:60];
    label.text = @"Fuckit";
    
    [self.view.subviews[0] addSubview:label];
    
    /// PPPPPAralacks
    UIInterpolatingMotionEffect *motionEffect;
    
    motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    motionEffect.minimumRelativeValue = @-25;
    motionEffect.maximumRelativeValue = @25;
    [label addMotionEffect:motionEffect];
    
    motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    motionEffect.minimumRelativeValue = @-25;
    motionEffect.maximumRelativeValue = @25;
    [label addMotionEffect:motionEffect];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@", textField.text);
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

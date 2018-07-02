//
//  NGNavigationController.m
//  nigimitama
//
//  Created by tauCross on 2018/7/2.
//  Copyright © 2018年 tc. All rights reserved.
//

#import "NGNavigationController.h"

#import "NGViewController.h"



@interface NGNavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end


@implementation NGNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self resetAppearance];
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
    self.interactivePopGestureRecognizer.delaysTouchesBegan = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(self.viewControllers.count > 1)
    {
        UIViewController *viewController = self.viewControllers.lastObject;
        [self popViewControllerAnimated:NO];
        [self pushViewController:viewController animated:NO];
    }
}

- (void)resetAppearance
{
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = @{
                                               NSFontAttributeName : [UIFont systemFontOfSize:18 weight:UIFontWeightMedium],
                                               NSForegroundColorAttributeName : HEXCOLOR(@"444444")
                                               };
    UIImage *image = [[UIImage alloc] init];
    [self.navigationBar setBackgroundImage:image
                            forBarPosition:UIBarPositionAny
                                barMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage imageWithColor:HEXCOLOR(@"ECECEC") size:CGSizeMake(1, 1 / SCREEN_SCALE)];
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

- (UIViewController *)childViewControllerForStatusBarHidden
{
    return self.topViewController;
}

#pragma mark - UINavigationControllerDelegate
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
{
    if(self.viewControllers.count >= 1)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        [self.viewControllers.lastObject.view endEditing:YES];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if(navigationController.viewControllers.firstObject != viewController && [viewController isKindOfClass:[NGViewController class]])
    {
        UIImage *image = [NGImage(@"public_nav_back") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:viewController action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = item;
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if(gestureRecognizer == self.interactivePopGestureRecognizer && self.viewControllers.count <= 1)
    {
        return NO;
    }
    return YES;
}


@end

//
//  NGMainViewController.m
//  nigimitama
//
//  Created by tauCross on 2018/7/2.
//  Copyright © 2018年 tc. All rights reserved.
//

#import "NGMainViewController.h"

#import "NGHomeViewController.h"
#import "NGSettingViewController.h"
#import "NGNavigationController.h"



@interface NGMainViewController ()

@property(nonatomic, strong)NGNavigationController *home;
@property(nonatomic, strong)NGNavigationController *setting;

@end


@implementation NGMainViewController

+ (instancetype)standardController
{
    static NGMainViewController *controller = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller = [[NGMainViewController alloc] init];
    });
    return controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.translucent = NO;
    [self.tabBar setBackgroundImage:[[UIImage alloc] init]];
    [self.tabBar setShadowImage:[UIImage imageWithColor:HEXCOLOR(@"ECECEC") size:CGSizeMake(1, 1)]];
    [self createComponents];
    [self resetTabItems];
    [self setupComponents];
}


- (void)createComponents
{
    self.home = [[NGNavigationController alloc] initWithRootViewController:[[NGHomeViewController alloc] init]];
    self.setting = [[NGNavigationController alloc] initWithRootViewController:[[NGSettingViewController alloc] init]];
}

- (void)resetTabItems
{
    self.home.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    self.setting.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
}

- (void)setupComponents
{
    self.viewControllers = @[self.home, self.setting];
}

@end

//
//  NGAppLauncher.m
//  nigimitama
//
//  Created by tauCross on 2018/7/2.
//  Copyright © 2018年 tc. All rights reserved.
//

#import "NGAppLauncher.h"

#import "NGMainViewController.h"



@implementation NGAppLauncher

+ (void)launch
{
    [NGAppLauncher standardLauncher];
}

+ (instancetype)standardLauncher
{
    static NGAppLauncher *launcher = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        launcher = [[NGAppLauncher alloc] init];
    });
    return launcher;
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        [self launch];
    }
    return self;
}

- (void)launch
{
    [self launchUI];
}

#pragma mark - Launch
- (void)launchUI
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [NGMainViewController standardController];
    [[UIApplication sharedApplication] delegate].window = window;
    [window makeKeyAndVisible];
}

@end

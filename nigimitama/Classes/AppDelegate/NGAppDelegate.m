//
//  NGAppDelegate.m
//  nigimitama
//
//  Created by tauCross on 2018/7/2.
//  Copyright © 2018年 tc. All rights reserved.
//

#import "NGAppDelegate.h"

#import "NGAppLauncher.h"



@implementation NGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NGAppLauncher launch];
    return YES;
}

@end
